import 'package:clinician_app/src/utils/styles/textstyles.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helper.dart';
import '../../../../utils/routes.dart';
import '../../../../utils/styles/colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

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
                    style:
                        AppTextStyles.h6.copyWith(color: AppColors.offWhite)),
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
                          style: AppTextStyles.b1
                              .copyWith(color: AppColors.offWhite)),
                      trailing: Icon(_items[index]['icon'],
                          color: AppColors.offWhite),
                      onTap: () => _items[index]['route'] != null
                          ? Navigator.pushNamedAndRemoveUntil(
                              context, _items[index]['route'], (_) => false,
                              arguments: _items[index]['args'])
                          : Navigator.pop(context),
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
                          style: AppTextStyles.b3)
                      : const SizedBox()))
        ],
      ),
    );
  }
}
