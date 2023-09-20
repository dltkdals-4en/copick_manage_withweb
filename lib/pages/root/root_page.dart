import 'package:copick_manage_withweb/constants/loading_screen.dart';
import 'package:copick_manage_withweb/pages/home/home_page.dart';
import 'package:copick_manage_withweb/provider/get_data_provider.dart';
import 'package:copick_manage_withweb/provider/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<GetDataProvider>(context);
    var ui = Provider.of<UiProvider>(context);
    if (!data.haveLoc) {
      data.getLocData();
      return LoadingScreen();
    } else if (!data.haveTask) {
      data.getTaskData();
      return LoadingScreen();
    } else {
      ui.selectedArea = data.areaInfo;
      ui.taskList = data.taskList;
      ui.wasteList = data.locList;
      return HomePage();
    }
  }
}
