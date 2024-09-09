import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/styles/colors.dart';

class UsernameSection extends ConsumerWidget {
  const UsernameSection({super.key, required this.onChanged});

  final Function onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Username', errorStyle: TextStyle(color: AppColors.red)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Username is required';
        }
        return null;
      },
      onChanged: (value) => onChanged(value),
    );
  }
}
