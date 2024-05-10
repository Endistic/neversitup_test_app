import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neversitup_app/config/config.dart';
import 'package:neversitup_app/config/routes/route_provider.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeConfig = ref.watch(routeProvider);
    return MaterialApp.router(
      title: "Department App",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.light,
      routeInformationParser: routeConfig.routeInformationParser,
      routerDelegate: routeConfig.routerDelegate,
      routeInformationProvider: routeConfig.routeInformationProvider
    );
  }
}
