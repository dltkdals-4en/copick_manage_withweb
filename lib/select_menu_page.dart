import 'package:copick_manage_withweb/task_manage/task_manage_page.dart';
import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:copick_manage_withweb/location_manage/location_manage_page.dart';
import 'package:copick_manage_withweb/provider/task_provider.dart';

import 'package:copick_manage_withweb/task_record/record_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectMenuPage extends StatelessWidget {
  const SelectMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context);
    return DefaultTabController(
      length: 3,
      initialIndex: taskProvider.currentDefaultTabIndex,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightPrimary,
          title: Text('CO:PICK 관리'),
          bottom: TabBar(
            labelPadding: EdgeInsets.all(10),
            indicatorColor: AppColors.white,
            onTap: (value) {
              print(value);
              taskProvider.changeTabIndex(value);
            },
            tabs: [
              Text('매장 관리'),
              Text('태스크 관리'),
              Text('수거 기록 보기'),
            ],
          ),
        ),
        body: Center(
          child: TabBarView(
            children: [
              WasteLocationPage(),
              TaskManagePage(),
              RecordPage(),
            ],
          ),
        ),
      ),
    );
  }
}
