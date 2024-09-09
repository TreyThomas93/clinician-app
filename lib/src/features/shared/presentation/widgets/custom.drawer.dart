import 'package:clinician_app/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/helper.dart';
import '../../../../utils/routes.dart';
import '../../../../utils/styles/colors.dart';
import '../../../authentication/presentation/controllers/login.controller.dart';

class CustomDrawer extends ConsumerStatefulWidget {
  const CustomDrawer({super.key});

  @override
  ConsumerState<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends ConsumerState<CustomDrawer> {
  bool loggingOut = false;

  List<Map<String, dynamic>> get _items => [
        {'title': 'Item1', 'icon': Icons.list, 'route': null, 'args': null},
        {'title': 'Item2', 'icon': Icons.sync, 'route': null, 'args': null},
        {'title': 'Item3', 'icon': Icons.book, 'route': null, 'args': null},
        {
          'title': 'Item4',
          'icon': Icons.psychology,
          'route': null,
          'args': null
        },
        {'title': 'Item5', 'icon': Icons.code, 'route': null, 'args': null},
        {'title': 'Item6', 'icon': Icons.search, 'route': null, 'args': null},
        {'title': 'Item7', 'icon': Icons.settings, 'route': null, 'args': null},
        {
          'title': 'Logout',
          'icon': Icons.logout,
          'route': NavRouter.login.path,
          'args': {"logout": true}
        },
      ];

  _onTap(Map<String, dynamic> item) async {
    if (item['route'] != null) {
      // if title is Logout, then we need to logout the user
      if (item['title'] == 'Logout') {
        setState(() {
          loggingOut = true;
        });
        await ref.read(authController.notifier).logout();
        setState(() {
          loggingOut = false;
        });
        if (mounted) {
          Navigator.pushReplacementNamed(context, item['route'],
              arguments: item['args']);
        }
      } else {
        Navigator.pushNamed(context, item['route'], arguments: item['args']);
      }
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.offWhite,
      child: Column(
        children: [
          Container(
            color: AppColors.darkBlue,
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Clinician App",
                    style: context.theme.textTheme.titleLarge!
                        .copyWith(color: AppColors.offWhite)),
                IconButton(
                    icon: const Icon(Icons.close, color: AppColors.offWhite),
                    onPressed: () => Navigator.pop(context))
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, index) => ListTile(
                      tileColor: AppColors.blueGrey,
                      title: Text(_items[index]['title'],
                          style: context.theme.textTheme.bodyMedium!
                              .copyWith(color: AppColors.offWhite)),
                      trailing: loggingOut && _items[index]['title'] == 'Logout'
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator())
                          : Icon(_items[index]['icon'],
                              color: AppColors.offWhite),
                      onTap: () => _onTap(_items[index]),
                    ),
                separatorBuilder: (_, __) => const Divider(
                    height: 0, thickness: 2, color: AppColors.gold),
                itemCount: _items.length),
          ),
          SizedBox(
              height: 25,
              child: FutureBuilder(
                  future: Helper.packageVersion,
                  builder: (_, snapshot) => snapshot.hasData
                      ? Text("Version ${snapshot.data}",
                          style: context.theme.textTheme.labelSmall!
                              .copyWith(color: AppColors.blueGrey))
                      : const SizedBox()))
        ],
      ),
    );
  }
}
