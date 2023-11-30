import 'package:copick_manage_withweb/constants/loading_screen.dart';
import 'package:copick_manage_withweb/pages/home/home_page.dart';
import 'package:copick_manage_withweb/provider/get_data_provider.dart';
import 'package:copick_manage_withweb/provider/task_manage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<GetDataProvider>(context);
    var tmProvider = Provider.of<TaskManageProvider>(context);
    if (!data.haveLoc) {
      data.getLocData();
      return const LoadingScreen();
    } else if (!data.haveTask) {
      data.getTaskData();
      return const LoadingScreen();
    } else {
      tmProvider.selectedArea = data.areaInfo;
      tmProvider.taskList = data.taskList;
      tmProvider.sortLocList(data.locList);
      // ui.wasteList = data.locList;

      return const HomePage();
    }
  }
}
