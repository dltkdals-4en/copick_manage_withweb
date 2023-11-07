import 'dart:ui';

import 'package:copick_manage_withweb/pages/task_manage_page/widgets/task_app_bar_widget.dart';
import 'package:copick_manage_withweb/pages/task_manage_page/widgets/task_order_page.dart';
import 'package:copick_manage_withweb/provider/task_manage_provider.dart';
import 'package:copick_manage_withweb/utilitys/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../utilitys/colors.dart';

class TaskManagePage extends StatelessWidget {
  const TaskManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    var tmProvider = Provider.of<TaskManageProvider>(context);
    var items = tmProvider.taskDayList;
    tmProvider.teamList();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: TaskAppBarWidget(),
          centerTitle: true,
        ),
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: Padding(
            padding: const EdgeInsets.all(NORMALGAP),
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        tmProvider.deleteTask();
                      },
                      child: Text('태스크 추가'),
                    ),
                    kNorW,
                    ElevatedButton(
                      onPressed: () {
                        tmProvider.deleteAllTask();
                      },
                      child: Text('추가 태스크 삭제'),
                    ),
                    kNorW,
                    ElevatedButton(
                      onPressed: () {
                        tmProvider.deleteAllTask();
                      },
                      child: Text('태스크 전체 삭제'),
                    ),
                  ],
                ),
                kBigH,
                Container(
                  child: Column(
                    children: [
                      TextFormField(

                      ),
                      (tmProvider.)
                    ],
                  ),
                ),
                TabBar(
                  tabs: const [

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
                  labelPadding: const EdgeInsets.all(SMALLGAP),
                  indicatorColor: KColors.lightPrimary,

                ),
                const Expanded(
                  child: TabBarView(
                    children: [

                      TaskOrderPage(),
                      TaskOrderPage(),
                      TaskOrderPage(),
                      TaskOrderPage(),
                    ],
                  ),
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
