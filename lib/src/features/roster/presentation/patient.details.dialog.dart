import 'package:clinician_app/src/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../utils/styles/colors.dart';
import '../../../utils/styles/textstyles.dart';
import '../domain/patient.model.dart';

void patientDetailsDialog(BuildContext context, Patient patient) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Patient Details", style: AppTextStyles.h6),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: 40, backgroundImage: NetworkImage(patient.imageUrl!)),
              const SizedBox(height: 10),
              for (final field in patient.toMap().entries)
                if (field.key != 'imageUrl')
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: '${field.key.capitalize()}: ',
                            style: AppTextStyles.b2
                                .copyWith(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: field.value is List
                                ? '${field.value.join(', ')}'
                                : '${field.value}',
                            style: AppTextStyles.b2)
                      ])))
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close',
                    style:
                        AppTextStyles.b2.copyWith(color: AppColors.offWhite)))
          ],
        );
      });
}
