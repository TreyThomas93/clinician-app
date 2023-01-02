import 'package:flutter/material.dart';

import '../../../../utils/styles/colors.dart';
import '../../../../utils/styles/textstyles.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void showSnackbar(String message,
    {bool error = false, int duration = 500}) async {
  snackbarKey.currentState?.removeCurrentSnackBar();

  await Future.delayed(Duration(milliseconds: duration), () {
    SnackBar snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(message,
          style: AppTextStyles.b3.copyWith(
              color: AppColors.offWhite, fontWeight: FontWeight.w600)),
      backgroundColor: error == true ? AppColors.red : AppColors.blueGrey,
    );
    snackbarKey.currentState?.showSnackBar(snackBar);
  });
}
