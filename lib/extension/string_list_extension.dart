import 'package:uuid/uuid.dart';

extension StringListExtension on Iterable<String> {
  String getUniqueID() {
    const uuid = Uuid();
    while (true) {
      final newID = uuid.v4();
      if (!contains(newID)) {
        return newID;
      }
    }
  }
}
