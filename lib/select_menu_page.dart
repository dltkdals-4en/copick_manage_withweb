import 'package:copick_manage_withweb/add_task/add_task_page.dart';
import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:flutter/material.dart';

import 'add_location/add_location_page.dart';

class SelectMenuPage extends StatelessWidget {
  const SelectMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Text('카페 추가'),
              Text('태스크 추가'),
            ],
          ),
        ),
        body: Center(
          child: TabBarView(
            children: [
              AddLocationPage(),
              AddTaskPage(),
            ],
          ),
        ),
      ),
    );
  }
}
