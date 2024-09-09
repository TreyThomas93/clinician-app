import 'package:flutter/material.dart';

void supportDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Support'),
      content: const Text('Please contact your administrator.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
