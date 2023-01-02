import 'package:clinician_app/src/features/authentication/presentation/login.screen.dart';
import 'package:flutter/material.dart';

import '../features/roster/presentation/roster.screen.dart';

var generatedRoutes = (RouteSettings settings) {
  final String? routeName = settings.name;

  if (NavRouter.login.path == routeName) {
    return MaterialPageRoute(
      builder: (_) => const LoginScreen(),
      settings: settings,
    );
  }

  if (NavRouter.roster.path == routeName) {
    return MaterialPageRoute(
      builder: (_) => const RosterScreen(),
      settings: settings,
    );
  }
  return null;
};

enum NavRouter {
  login("login"),
  roster("roster");

  const NavRouter(this.path);

  final String path;
}
