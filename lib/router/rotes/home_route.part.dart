part of '../router.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    if (kIsWeb) {
      return const WebEntry();
    }
    return const MyHomePage();
  }
}
