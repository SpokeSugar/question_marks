import 'dart:io';

import 'package:path/path.dart' as p;

extension FileDirectoryCopy on Directory {
  Future<void> copyDirectory(Directory destination) async {
    await for (final entry in list(recursive: false)) {
      if (entry is Directory) {
        final newDirectory = await Directory(
                p.join(destination.absolute.path, p.basename(entry.path)))
            .create();
        copyDirectory(newDirectory);
      } else if (entry is File) {
        await entry.copy(p.join(destination.path, p.basename(entry.path)));
      }
    }
  }
}
