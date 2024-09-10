import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/user_model.dart';

abstract class RemoteRepository {
  factory RemoteRepository() => RemoteRepositoryImpl();

  Future<User> login(String email, String password);
  Future<void> logout();
}

class RemoteRepositoryImpl implements RemoteRepository {
  @override
  Future<User> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return User(name: 'John Doe', email: email);
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}

final remoteRepositoryProvider = Provider<RemoteRepository>((ref) {
  return RemoteRepository();
});
