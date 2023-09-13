import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:question_marks/extension/boolean_to_int.dart';
import 'package:question_marks/model/answer/answer.dart';
import 'package:question_marks/model/answer_result/answer_result.dart';
import 'package:question_marks/model/question/question.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:uuid/uuid.dart';

import '../../logger.dart';
import '../../model/question_column/question_column.dart';
import 'database_constant.dart';

class DatabaseManager {
  const DatabaseManager._(this._database);

  final Database _database;

  static final _option = OpenDatabaseOptions(
      version: 0,
      onConfigure: (ftx) => ftx.execute('''
            PRAGMA foreign_keys=true
            '''),
      onCreate: (trx, value) async {
        await trx.execute(QuestionsTable.create);

        await trx.execute(QuestionListIDTable.create);

        await trx.execute(QuestionListEntryTable.create);

        await trx.execute(QuestionListEntryTable.createQuestionIdIndex);

        await trx.execute(AnswersTable.create);

        await trx.execute(SessionsTable.create);
      });

  static Future<DatabaseManager> open() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dff = databaseFactoryFfi;
    final databasePath = p.join(appDir.path, "databases", "app_db.db");
    return DatabaseManager._(
      await dff.openDatabase(
        databasePath,
        options: _option,
      ),
    );
  }

  Future<void> close() async {
    await _database.close();
  }

  Future<List<QuestionColumn>> getQuestionList() async {
    final list = await _database.query(QuestionListIDTable.tableName);
    return List.generate(
      list.length,
      (index) => QuestionColumn.fromJson(list[index]),
    );
  }

  Future<void> deleteQuestionList(String listID) async {
    await _database.transaction((txn) async {
      await txn.delete(
        QuestionListEntryTable.tableName,
        where: "${QuestionListEntryTable.listId} = ?",
        whereArgs: [listID],
      );
      return txn.delete(
        QuestionListIDTable.tableName,
        where: "${QuestionListIDTable.questionListID} = ?",
        whereArgs: [listID],
      );
    });
  }

  Future<void> deleteOutOfListQuestions() async {
    await _database.transaction((txn) async {
      await txn.rawDelete('''
      DELETE q FROM ${QuestionsTable.tableName} q LEFT JOIN ${QuestionListEntryTable.tableName} ql ON q.${QuestionsTable.questionID} = ql.${QuestionListEntryTable.questionId} WHERE ql.${QuestionListEntryTable.listId} IS NULL
      ''');
    });
  }

  Future<String> addQuestionID(String title, {String? id}) async {
    final generateID = const Uuid().v4();
    try {
      await _database.insert(QuestionListIDTable.tableName, {
        QuestionListIDTable.questionListID: id ?? generateID,
        QuestionListIDTable.title: title,
      });
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        return addQuestionID(title);
      } else {
        rethrow;
      }
    }
    return generateID;
  }

  Future<List<QuestionModel>> getQuestions(String listID) async {
    List<QuestionModel> questions = [];

    List<Map<String, Object?>> idList = await _database.rawQuery(
      '''
        SELECT b.*
        FROM ${QuestionListEntryTable.tableName} a ,${QuestionsTable.tableName} b 
        WHERE a.${QuestionListEntryTable.questionId} = b.${QuestionsTable.questionID}
        ORDER BY a.${QuestionListEntryTable.index} 
        ''',
      [listID],
    );

    for (int i = 0; i < idList.length; i++) {
      final answersRaw = await _database.rawQuery('''
        SELECT *
        FROM ${AnswersTable.tableName} 
        WHERE ${AnswersTable.questionID} = ?
      ''', [idList[i][QuestionsTable.questionID]]);
      final answers = List.generate(
          answersRaw.length,
          (j) => AnswerModel(
              uuid: answersRaw[i][AnswersTable.answerID] as String,
              label: answersRaw[i][AnswersTable.label] as String,
              exp: answersRaw[i][AnswersTable.explanation] as String?,
              isCorrect:
                  (answersRaw[i][AnswersTable.isCollect] as int).toBool()));
      questions.add(QuestionModel(
        uuid: idList[i][QuestionsTable.questionID] as String,
        q: idList[i][QuestionsTable.q] as String,
        imagePath: idList[i][QuestionsTable.imagePath] as String?,
        explanation: idList[i][QuestionsTable.explanation] as String?,
        answers: answers,
      ));
    }

    return questions;
  }

  Future<QuestionModel?> getQuestion(String questionID) async {
    try {
      final question = await _database.rawQuery(
          'SELECT * FROM ${QuestionsTable.tableName} WHERE ${QuestionsTable.questionID} = ?',
          [questionID]);

      final answersRaw = await _database.rawQuery(
        'SELECT * FROM ${AnswersTable.tableName} WHERE ${AnswersTable.questionID} = ?',
        [question.first[QuestionsTable.questionID]],
      );

      final answers = List.generate(
        answersRaw.length,
        (j) => AnswerModel(
          uuid: answersRaw.first[AnswersTable.answerID] as String,
          label: answersRaw.first[AnswersTable.label] as String,
          exp: answersRaw.first[AnswersTable.explanation] as String?,
          isCorrect: (answersRaw.first[AnswersTable.isCollect] as int).toBool(),
        ),
      );

      return QuestionModel(
        uuid: question.first[QuestionsTable.questionID] as String,
        q: question.first[QuestionsTable.q] as String,
        imagePath: question.first[QuestionsTable.imagePath] as String?,
        explanation: question.first[QuestionsTable.explanation] as String?,
        answers: answers,
      );
    } catch (e, st) {
      logger.e(e, stackTrace: st);
      return null;
    }
  }

  Future<String> addQuestion(String listID,
      {required String q, String? id, String? exp, String? imagePath}) async {
    try {
      final questionID = id ?? const Uuid().v4();
      _database.insert(
        QuestionsTable.tableName,
        {
          QuestionsTable.questionID: questionID,
          QuestionsTable.q: q,
          QuestionsTable.explanation: exp,
          QuestionsTable.imagePath: imagePath
        },
      );
      return questionID;
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError() && id == null) {
        addQuestion(listID, q: q, exp: exp);
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
    throw UnimplementedError();
  }

  Future<void> updateQuestion(
    String id, {
    String? q,
    String? explanation,
    String? imagePath,
  }) async {
    Map<String, dynamic> map = {
      QuestionsTable.q: q,
      QuestionsTable.explanation: explanation,
      QuestionsTable.imagePath: imagePath
    };
    map.removeWhere((key, value) => value == null);
    await _database.update(QuestionsTable.tableName, map,
        where: "${QuestionsTable.questionID}=?", whereArgs: [id]);
  }

  Future<void> deleteQuestion(String id) async {
    await _database.transaction((txn) async {
      await txn.delete(
        QuestionListEntryTable.tableName,
        where: "${QuestionListEntryTable.questionId} = ?",
        whereArgs: [id],
      );

      await txn.execute('''
        UPDATE ${QuestionListEntryTable.tableName} a
        SET ${QuestionListEntryTable.index} = (SELECT COUNT(b.${QuestionListEntryTable.index})+1 
        from ${QuestionListEntryTable.tableName} b
        where a.${QuestionListEntryTable.listId} = b.${QuestionListEntryTable.listId} 
        and b.${QuestionListEntryTable.index} < a.${QuestionListEntryTable.index});
      ''');

      await txn.delete(
        AnswersTable.tableName,
        where: "${AnswersTable.questionID}=?",
        whereArgs: [id],
      );

      return txn.delete(
        QuestionsTable.tableName,
        where: "${QuestionsTable.questionID}=?",
        whereArgs: [id],
      );
    });
  }

  Future<void> addSession(
      {required String id,
      int? index,
      required String questionID,
      required bool isCollect,
      required List<String> answerID,
      DateTime? dateTime}) async {
    _database.transaction((txn) async {
      await txn.rawInsert('''
          INSERT INTO ${SessionsTable.tableName}(
          ${SessionsTable.sessionsID},
          ${SessionsTable.index},
          ${SessionsTable.questionID},
          ${SessionsTable.isCollect},
          ${SessionsTable.datetime}) 
          VALUES(?,ifnull(?,(SELECT MAX(${SessionsTable.index}) FROM ${SessionsTable.tableName} WHERE ${SessionsTable.sessionsID} = ?) + 1),?,?,?)
          ''', [
        id,
        index,
        id,
        questionID,
        isCollect.toInt(),
        (dateTime ?? DateTime.now()).toIso8601String()
      ]);

      if (index != null) {
        await txn.delete(SessionAnswerTable.tableName,
            where:
                "${SessionAnswerTable.sessionAnswerID}=? AND ${SessionAnswerTable.index}=?",
            whereArgs: [id, index]);
      }

      for (final i in answerID) {
        await txn.rawInsert('''
          INSERT INTO ${SessionAnswerTable.tableName}(
            ${SessionAnswerTable.sessionAnswerID},
            ${SessionAnswerTable.index},
            ${SessionAnswerTable.answerID},
            ) 
            VALUES(?,ifnull(?,(SELECT MAX(${SessionsTable.index}) FROM ${SessionsTable.tableName} WHERE ${SessionsTable.sessionsID} = ?)),?)
        ''', [id, index, id, i]);
      }
      return;
    });
  }

  Future<AnswerResultModel> getSession(String sessionID, int index) async {
    final session = (await _database.query(SessionsTable.tableName,
            where: "${SessionsTable.sessionsID}=? AND ${SessionsTable.index}=?",
            whereArgs: [sessionID, index],
            limit: 1))
        .first;
    final rawAnswers = await _database.query(AnswersTable.tableName,
        columns: [AnswersTable.answerID, AnswersTable.isCollect],
        where: "${AnswersTable.questionID}=?",
        whereArgs: [session[SessionsTable.questionID]]);

    final answers =
        rawAnswers.map((e) => e[AnswersTable.answerID] as String).toList();

    final collectAnswers = rawAnswers
        .where((element) => element[AnswersTable.isCollect] == true)
        .map((e) => e[AnswersTable.answerID] as String)
        .toSet();

    final rawSelectAnswers = await _database.query(
      SessionAnswerTable.tableName,
      distinct: true,
      columns: [SessionAnswerTable.answerID],
      where:
          "${SessionAnswerTable.sessionAnswerID}=? AND ${SessionAnswerTable.index}=?",
      whereArgs: [sessionID, index],
    );

    final selectAnswers = List.of(rawSelectAnswers)
        .map((e) => e[SessionAnswerTable.answerID] as String)
        .toSet();

    return AnswerResultModel(
        sessionID: session[SessionsTable.sessionsID] as String,
        questionID: session[SessionsTable.questionID] as String,
        answers: answers,
        collectAnswer: collectAnswers,
        selectAnswer: selectAnswers,
        dateTime: DateTime.parse(session[SessionsTable.datetime] as String));
  }

  Future<List<AnswerResultModel>> getAllSession(String sessionID) async {
    final List<AnswerResultModel> result = [];
    final sessions = await _database.query(SessionsTable.tableName,
        where: "${SessionsTable.sessionsID}=?", whereArgs: [sessionID]);
    for (final i in sessions) {
      final rawAnswers = await _database.query(
        AnswersTable.tableName,
        columns: [AnswersTable.answerID, AnswersTable.isCollect],
        where: "${AnswersTable.questionID}=?",
        whereArgs: [i[SessionsTable.questionID]],
      );
      final answers =
          rawAnswers.map((e) => e[AnswersTable.answerID] as String).toList();
      final collectAnswers = rawAnswers
          .where((e) => e[AnswersTable.isCollect] == true)
          .map((e) => e[AnswersTable.answerID] as String)
          .toSet();
      final rawSelectAnswer = await _database.query(
          SessionAnswerTable.tableName,
          columns: [SessionAnswerTable.answerID],
          where:
              "${SessionAnswerTable.sessionAnswerID}=? AND ${SessionAnswerTable.index}=?",
          whereArgs: [i[SessionsTable.sessionsID], i[SessionsTable.index]]);
      final selectAnswer = rawSelectAnswer
          .map((e) => e[SessionAnswerTable.answerID] as String)
          .toSet();

      result.add(
        AnswerResultModel(
          sessionID: sessionID,
          questionID: i[SessionsTable.questionID] as String,
          answers: answers,
          collectAnswer: collectAnswers,
          selectAnswer: selectAnswer,
          dateTime: DateTime.parse(i[SessionsTable.datetime] as String),
        ),
      );
    }
    return result;
  }

  Future<void> deleteSession(String sessionID) async {
    await _database.transaction((txn) async {
      await txn.delete(
        SessionAnswerTable.tableName,
        where: "${SessionAnswerTable.sessionAnswerID}=?",
        whereArgs: [sessionID],
      );
      await txn.delete(
        SessionsTable.tableName,
        where: "${SessionsTable.sessionsID}=?",
        whereArgs: [sessionID],
      );
    });
  }

  Future<void> deleteAllSession() async {
    await _database.transaction((txn) async {
      await txn.delete(SessionAnswerTable.tableName);
      await txn.delete(SessionsTable.tableName);
      await txn.execute("VACUUM");
    });
  }
}
