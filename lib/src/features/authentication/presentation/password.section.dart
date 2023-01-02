import 'package:clinician_app/src/features/authentication/presentation/controllers/login.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/styles/colors.dart';

class PasswordSection extends ConsumerStatefulWidget {
  const PasswordSection({super.key, required this.callback});

  final Function callback;

  @override
  ConsumerState<PasswordSection> createState() => _PasswordSectionState();
}

class _PasswordSectionState extends ConsumerState<PasswordSection> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        errorStyle: const TextStyle(color: AppColors.red),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              // toggle password visibility
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        return null;
      },
      onFieldSubmitted: (_) => widget.callback(),
      onChanged: (value) => ref.read(passwordProvider.notifier).state = value,
    );
  }
}
