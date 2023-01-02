import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LoginState { none, loggingIn, success, error, invalid }

final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, LoginState>((ref) {
  return LoginController(ref);
});

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(LoginState.none) {
    ref.onDispose(() {
      log('disposing login controller');
      ref.invalidate(usernameProvider);
      ref.invalidate(passwordProvider);
    });
  }

  final Ref ref;

  void login() async {
    try {
      state = LoginState.loggingIn;
      await Future.delayed(const Duration(seconds: 1));
      state = LoginState.success;
    } catch (e) {
      state = LoginState.error;
    }
  }
}

final usernameProvider = StateProvider<String?>((_) => null);
final passwordProvider = StateProvider<String?>((_) => null);
