// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:riverpod/riverpod.dart';
// import 'package:vip_app_patrol/authentication/provider/authentication_provider.dart';
// import 'package:vip_app_patrol/config/routes/routes.dart';

// FutureOr<String?> appRouteRedirect(
//     BuildContext context, Ref ref, GoRouterState state) async {
//   final notifier = ref.watch(getIsAuthenticatedProvider);

//   final isAuth = notifier.value;
//   final loggedIn = isAuth != false;
//   final loggingOut = isAuth == false && state.matchedLocation == '/';
//   final loggingIn = state.matchedLocation == '/login';

//   if (loggingOut) return RouteLocation.login;
//   if (loggedIn && loggingIn) return RouteLocation.home;
//   if (isAuth == false) return RouteLocation.splash;

//   return null;
// }
