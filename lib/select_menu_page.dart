import 'package:copick_manage_withweb/add_task/add_task_page.dart';
import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:copick_manage_withweb/provider/task_provider.dart';
import 'package:copick_manage_withweb/task_record/record_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_location/add_location_page.dart';

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
          bottom: TabBar(
            tabs: [
              Text('카페 추가'),
              Text('태스크 추가'),
              Text('수거 기록 보기'),
            ],
          ),
        ),
        body: Center(
          child: TabBarView(
            children: [
              AddLocationPage(),
              AddTaskPage(),
              RecordPage(),
            ],
          ),
        ),
      ),
    );
  }
}
