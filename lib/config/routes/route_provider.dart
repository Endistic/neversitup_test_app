import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neversitup_app/config/routes/app_routes.dart';
import 'package:neversitup_app/config/routes/route_location.dart';
import 'package:riverpod/riverpod.dart';

final navigationKey = GlobalKey<NavigatorState>();
final routeProvider = Provider<GoRouter>((ref) {
  // final authState = ref.watch(authProvider);
  // final authState = ref.watch(getIsAuthenticatedProvider);

  return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: RouteLocation.home,
      navigatorKey: navigationKey,
      //redirectLimit: 1,
      //routerNeglect: true,

      redirect: (context, state) async {
        return null;
      },
      errorBuilder: (context, state) => SizedBox(),

      //refreshListenable: authState,
      // refreshListenable: notifier,
      routes: appRoutes);
});
