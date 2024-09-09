import 'package:clinician_app/src/features/shared/presentation/widgets/custom.drawer.dart';
import 'package:clinician_app/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../utils/styles/colors.dart';
import '../domain/patient.model.dart';
import 'controllers/roster.controller.dart';
import 'patient.details.dialog.dart';

class RosterScreen extends ConsumerStatefulWidget {
  const RosterScreen({super.key});

  @override
  ConsumerState<RosterScreen> createState() => _RosterScreenState();
}

class _RosterScreenState extends ConsumerState<RosterScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Roster'),
              centerTitle: true,
            ),
            body: Consumer(builder: (context, ref, child) {
              final patients = ref.watch(rosterFutureProvider);

              return RefreshIndicator(
                onRefresh: () async => ref
                    .read(futureTriggerProvider.notifier)
                    .update((state) => !state),
                child: patients.when(
                    data: (patients) => Scrollbar(
                          controller: _scrollController,
                          child: GroupedListView<Patient, String>(
                            controller: _scrollController,
                            physics: const AlwaysScrollableScrollPhysics(),
                            elements: patients,
                            groupBy: (patient) => patient.lastName[0],
                            groupSeparatorBuilder: (String groupByValue) =>
                                Container(
                                    color: AppColors.gold,
                                    padding: const EdgeInsets.all(8),
                                    child: Text(groupByValue,
                                        style: context
                                            .theme.textTheme.titleLarge!
                                            .copyWith(
                                                color: AppColors.offWhite))),
                            itemBuilder: (_, patient) => ListTile(
                                title: Text(patient.name,
                                    style: context.theme.textTheme.labelLarge),
                                subtitle: Text(patient.dateOfBirth,
                                    style: context.theme.textTheme.labelSmall),
                                trailing: const Icon(Icons.arrow_forward_ios,
                                    size: 16),
                                onTap: () =>
                                    patientDetailsDialog(context, patient)),
                            itemComparator: (p1, p2) =>
                                p1.name.compareTo(p2.name),
                            order: GroupedListOrder.ASC,
                            useStickyGroupSeparators: true,
                          ),
                        ),
                    loading: () => const Center(
                        child:
                            CircularProgressIndicator(color: AppColors.gold)),
                    error: (error, stack) => const Center(
                        child:
                            Text('Something went wrong. Please try again.'))),
              );
            }),
            drawer: const CustomDrawer()),
      ),
    );
  }
}
