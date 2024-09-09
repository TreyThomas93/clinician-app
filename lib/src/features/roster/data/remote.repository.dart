import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemoteRepository {
  Future<List<Map<String, dynamic>>> getPatients() async {
    await Future.delayed(const Duration(seconds: 2));
    final String response = await rootBundle.loadString('assets/data/patients.json');
    return List<Map<String, dynamic>>.from(json.decode(response));
  }
}

final remoteRepositoryProvider = Provider<RemoteRepository>((ref) {
  return RemoteRepository();
});
