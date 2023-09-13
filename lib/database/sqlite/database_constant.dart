final class QuestionListIDTable {
  const QuestionListIDTable._();

  static const tableName = "QuestionListID";

  static const create = '''
          CREATE TABLE $tableName(
            $questionListID TEXT PRIMARY KEY,
            $title TEXT NOT NULL
            $recentUsedBy TEXT,
            $createBy TEXT
          );
        ''';

  static const questionListID = "id";
  static const title = "title";
  static const recentUsedBy = "recentUsedBy";

  static const createBy = "createBy";
}

final class QuestionListEntryTable {
  const QuestionListEntryTable._();

  static const tableName = "QuestionListEntry";

  static const create = '''
          CREATE TABLE $tableName(
            $listId TEXT NOT NULL,
            $index INTEGER NOT NULL, 
            $questionId TEXT NOT NULL,
            FOREIGN KEY ($listId) REFERENCES ${QuestionListIDTable.tableName}(${QuestionListIDTable.questionListID}) ON DELETE CASCADE,
            FOREIGN KEY ($questionId) REFERENCES Questions(id) ON DELETE CASCADE,
            PRIMARY KEY($listId, $index)
          );
        ''';

  static const createQuestionIdIndex =
      "CREATE INDEX $questionListEntryQuestionIDIndex ON $tableName($questionId)";

  static const listId = 'listId';
  static const index = 'index';
  static const questionId = 'questionId';
  static const questionListEntryQuestionIDIndex =
      "questionListEntryQuestionIDIndex";
}

final class QuestionsTable {
  const QuestionsTable._();

  static const tableName = 'Questions';

  static const create = '''
          CREATE TABLE $tableName(
            $questionID TEXT PRIMARY KEY,
            $q TEXT NOT NULL,
            $explanation TEXT,
            $imagePath TEXT,
            $enable INT NOT NULL DEFAULT 1,
          );
          ''';

  static const deleteFromIDList = '''
      DELETE
      FROM ${QuestionsTable.tableName} 
      WHERE ${QuestionsTable.questionID} = ANY(
        (SELECT DISTINCT ${QuestionListEntryTable.questionId}
        FROM ${QuestionListEntryTable.tableName})
        MINUS
        (SELECT DISTINCT ${QuestionListEntryTable.questionId}
        FROM ${QuestionListEntryTable.tableName}
        WHERE ${QuestionListEntryTable.listId} <> ?)
      )
      ''';

  static const questionID = "id";
  static const q = "q";
  static const explanation = 'explanation';
  static const imagePath = "imagePath";
  static const enable = "enable";
}

final class AnswersTable {
  const AnswersTable._();

  static const tableName = 'Answers';

  static const create = '''
          CREATE TABLE $tableName(
            $answerID TEXT PRIMARY KEY,
            $questionID TEXT NOT NULL,
            $label TEXT NOT NULL,
            $explanation TEXT,
            $isCollect INT NOT NULL,
            $enable INT NOT NULL DEFAULT 1,
            FOREIGN KEY $questionID REFERENCES ${QuestionsTable.tableName}(${QuestionsTable.questionID}) ON DELETE CASCADE
        );
        ''';
  static const answerID = "answerID";
  static const questionID = "questionID";
  static const label = "label";
  static const explanation = "explanation";
  static const isCollect = "isCollect";
  static const enable = "enable";
}

final class SessionsTable {
  const SessionsTable._();

  static const tableName = "Sessions";

  static const create = '''
              CREATE TABLE $tableName(
                $sessionsID TEXT NOT NULL,
                $index INTEGER NOT NULL,
                $questionID TEXT NOT NULL,
                $isCollect INT NOT NULL,
                $datetime TEXT NOT NULL,
                PRIMARY KEY ($sessionsID, $index)
            );
            ''';

  static const sessionsID = "sessionsID";
  static const index = "index";
  static const questionID = "questionID";
  static const isCollect = "isCollect";

  static const datetime = "datetime";
}

final class SessionAnswerTable {
  const SessionAnswerTable._();

  static const tableName = "SessionAnswers";

  static const create = '''
    CREATE TABLE $tableName(
    $sessionAnswerID TEXT NOT NULL,
    $index INTEGER NOT NULL,
    $answerID TEXT NOT NULL,
    FOREIGN KEY ($sessionAnswerID,$index) References ${SessionsTable.tableName}(${SessionsTable.sessionsID},${SessionsTable.index}) ON DELETE CASCADE
  );
  ''';

  static const sessionAnswerID = 'sessionAnswerID';
  static const index = 'index';
  static const answerID = "answerID";
}
