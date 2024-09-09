import 'package:flutter/material.dart';

import '../../../../utils/styles/colors.dart';

void displayLoadingDialog(BuildContext context) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrollable: true,
        content:
            Center(child: CircularProgressIndicator(color: AppColors.gold))),
  );
}
