import 'package:clinician_app/src/features/authentication/presentation/controllers/login.controller.dart';
import 'package:clinician_app/src/features/authentication/presentation/username.section.dart';
import 'package:clinician_app/src/utils/styles/textstyles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/routes.dart';
import '../../../utils/styles/colors.dart';
import '../../shared/presentation/widgets/load.dialog.dart';
import '../../shared/presentation/widgets/snackbar.dart';
import 'password.section.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ref.read(loginControllerProvider.notifier).login();
    }
  }

  @override
  Widget build(BuildContext context) {
    // listen to login controller
    ref.listen(loginControllerProvider, (_, state) {
      switch (state) {
        case LoginState.none:
          break;
        case LoginState.loggingIn:
          displayLoadingDialog(context);
          break;
        case LoginState.success:
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
              context, NavRouter.roster.path, (route) => false);
          break;
        case LoginState.error:
          Navigator.pop(context);
          showSnackbar('Error logging in. Please contact support or try again.',
              error: true);
          break;
        case LoginState.invalid:
          Navigator.pop(context);
          showSnackbar('Invalid username and/or password', error: true);
          break;
      }
    });

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Clinician App | Login'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 0.0),
            child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UsernameSection(callback: _submitForm),
                      const SizedBox(height: 16.0),
                      PasswordSection(callback: _submitForm),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () => _submitForm(),
                          child: Text('Login',
                              style: AppTextStyles.b1.copyWith(
                                  color: AppColors.offWhite,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Need Assistance? Contact',
                            style: AppTextStyles.b3
                                .copyWith(fontWeight: FontWeight.w500)),
                        TextSpan(
                          text: ' Support.',
                          style: AppTextStyles.b3.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.gold,
                              fontStyle: FontStyle.italic),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // TODO: show dialog with contact options.
                            },
                        ),
                      ])),
                    ])),
          ),
        ),
      ),
    );
  }
}
