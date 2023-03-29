part of '../router.dart';

@TypedGoRoute<FilePickerRoute>(path: "/load_files")
class FilePickerRoute extends GoRouteData {
  const FilePickerRoute();

  @override
  Widget build(context, state) => const FilePickerScreen();
}
