import 'package:flutter/material.dart';

import 'styles/colors.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

extension XBuildCtx on BuildContext {
  ThemeData get theme => Theme.of(this);

  void showSnackbar(String message,
      {bool error = false, int duration = 500}) async {
    snackbarKey.currentState?.removeCurrentSnackBar();

    await Future.delayed(Duration(milliseconds: duration), () {
      SnackBar snackBar = SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(message,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: AppColors.offWhite,
            )),
        backgroundColor: error == true ? AppColors.red : AppColors.blueGrey,
      );
      snackbarKey.currentState?.showSnackBar(snackBar);
    });
  }
}
