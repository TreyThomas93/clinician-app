import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/remote.repository.dart';
import '../../domain/patient.model.dart';

final rosterFutureProvider =
    FutureProvider.autoDispose<List<Patient>>((ref) async {
  final remoteRepository = ref.read(remoteRepositoryProvider);

  final patients = await remoteRepository.getPatients();

  return patients.map((patient) => Patient.fromMap(patient)).toList();
});
