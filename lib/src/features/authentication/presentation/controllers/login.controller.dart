import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/user_model.dart';

final authController =
    AsyncNotifierProvider<AuthController, User?>(() => AuthController());

class AuthController extends AsyncNotifier<User?> {
  Future<void> login(String email, String password) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      state = AsyncData(User(name: 'John Doe', email: email));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      state = const AsyncData(null);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  FutureOr<User?> build() {
    // * This is where you would check if the user is already logged in. If they are, return the user object. If not, return null.
    return null;
  }
}
