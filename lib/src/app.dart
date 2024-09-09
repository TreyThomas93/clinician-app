import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utils/extensions.dart';
import 'utils/routes.dart';
import 'utils/styles/theme.dart';

class ClinicianApp extends StatelessWidget {
  const ClinicianApp({super.key});

  @override
  Widget build(BuildContext context) {
    final orientations = <DeviceOrientation>[DeviceOrientation.portraitUp];

    SystemChrome.setPreferredOrientations(orientations);
    return MaterialApp(
      title: 'Clinician App',
      initialRoute: NavRouter.login.path,
      onGenerateRoute: generatedRoutes,
      debugShowCheckedModeBanner: kDebugMode,
      theme: AppThemes.primaryTheme,
      scaffoldMessengerKey: snackbarKey,
    );
  }
}
