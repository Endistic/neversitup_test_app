import 'package:go_router/go_router.dart';
import 'package:neversitup_app/config/routes/route_location.dart';
import 'package:neversitup_app/config/routes/route_provider.dart';
import 'package:neversitup_app/view/homescreen/homescreen.dart';


final appRoutes = [
  GoRoute(
    path: RouteLocation.home,
    name: 'home',
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
  ),
  
];
