import 'package:copick_manage_withweb/provider/task_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utilitys/colors.dart';

class SelectMenuPage extends StatelessWidget {
  const SelectMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context);
    return DefaultTabController(
      length: 2,
      initialIndex: taskProvider.currentDefaultTabIndex,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:KColors.lightPrimary,
          title: const Text('CO:PICK 관리'),
          bottom: TabBar(
            labelPadding: const EdgeInsets.all(10),
            indicatorColor:KColors.white,
            onTap: (value) {
              print(value);
              taskProvider.changeTabIndex(value);
            },
            tabs: const [
              Text('매장 관리'),
              Text('태스크 관리'),
            ],
          ),
          actions: [

            IconButton(
              onPressed: () async {
                // await FbHelper().deleteDummyData(taskProvider.taskList);
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     // FbHelper()
                //     //     .addDummyTaskData(taskProvider.taskList)
                //     FbHelper()
                //         .updateTeamToInt(taskProvider.taskList)
                //         .then((value) => Navigator.pop(context));
                //     return LoadingScreen();
                //   },
                // );
              },
              icon: const Icon(Icons.abc),
            ),
          ],
        ),
        body: const Center(
          child: TabBarView(
            children: [
              // WasteLocationPage(),
              // TaskManagePage(),
            ],
          ),
        ),
      ),
    );
  }
}

