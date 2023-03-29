part of '../router.dart';

@TypedGoRoute<LicenseRoute>(path: '/licenses')
class LicenseRoute extends GoRouteData {
  @override
  Widget build(context, state) => const LicensePage();
}
