import 'dart:ui';

import 'package:copick_manage_withweb/pages/task_manage_page/widgets/task_order_page.dart';
import 'package:copick_manage_withweb/provider/ui_provider.dart';
import 'package:copick_manage_withweb/utilitys/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../utilitys/colors.dart';

class TaskManagePage extends StatelessWidget {
  const TaskManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<UiProvider>(context);
    var items = ui.taskDayList;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: Container(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Text('전체'),
                    Text('A팀'),
                    Text('B팀'),
                    Text('C팀'),
                    Text('추가 요청'),
                  ],
                  labelStyle: makeTextStyle(
                      18, KColors.lightPrimary, 'bold'),
                  unselectedLabelStyle:
                  makeTextStyle(18, KColors.black, 'bold'),
                  labelColor: KColors.lightPrimary,
                  unselectedLabelColor: KColors.black,
                  labelPadding: EdgeInsets.all(SMALLGAP),
                  indicatorColor: KColors.lightPrimary,
                ),
                Expanded(
                  child: TabBarView(children: [
                    TaskOrderPage(),
                    TaskOrderPage(),
                    TaskOrderPage(),
                    TaskOrderPage(),
                    TaskOrderPage(),
                  ]),
                ),
                // PageView(
                //   controller: ui.teamPageController,
                //   children: [
                //     TaskOrderPage(),
                //     Container(
                //       color: Colors.black,
                //       child: Text('1'),
                //     ),
                //     Container(
                //       child: Text('1'),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
