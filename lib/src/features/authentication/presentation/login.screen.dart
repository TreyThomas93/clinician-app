import 'package:clinician_app/src/features/authentication/presentation/username.section.dart';
import 'package:clinician_app/src/utils/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/routes.dart';
import '../../../utils/styles/colors.dart';
import '../../shared/presentation/widgets/support.dialog.dart';
import 'controllers/login.controller.dart';
import 'password.section.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool loggingIn = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)!.settings.arguments as Map?;

      if (args != null && args.containsKey('logout')) {
        context.showSnackbar('You have been logged out.');
      }
    });
    super.initState();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // hide keyboard
      FocusScope.of(context).unfocus();

      try {
        setState(() {
          loggingIn = true;
        });
        await ref.read(authController.notifier).login(email!, password!);

        if (mounted) {
          Navigator.of(context).pushReplacementNamed(NavRouter.roster.path);
        }
      } catch (e) {
        if (mounted) context.showSnackbar('An error occurred', error: true);
      } finally {
        if (mounted) {
          setState(() {
            loggingIn = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Clinician App | Login'),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 0.0),
            child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UsernameSection(onChanged: (value) => email = value),
                      const SizedBox(height: 16.0),
                      PasswordSection(onChanged: (value) => password = value),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: loggingIn ? null : () => _submitForm(),
                          child: loggingIn
                              ? const SizedBox(
                                  height: 20.0,
                                  width: 20.0,
                                  child: CircularProgressIndicator())
                              : Text('Login',
                                  style: context.theme.textTheme.labelLarge!
                                      .copyWith(color: AppColors.offWhite)),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Need Assistance? Contact',
                            style: context.theme.textTheme.bodyMedium),
                        TextSpan(
                          text: ' Support.',
                          style: context.theme.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.gold,
                              fontStyle: FontStyle.italic),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              supportDialog(context);
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
