import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/remote.repository.dart';
import '../../domain/patient.model.dart';

final futureTriggerProvider = StateProvider<bool>((ref) => false);

final rosterFutureProvider =
    FutureProvider.autoDispose<List<Patient>>((ref) async {
  ref.watch(futureTriggerProvider);

  final remoteRepository = ref.read(remoteRepositoryProvider);

  final patients = await remoteRepository.getPatients();

  return patients.map((patient) => Patient.fromMap(patient)).toList();
});
