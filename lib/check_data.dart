
import 'package:copick_manage_withweb/provider/task_provider.dart';
import 'package:copick_manage_withweb/provider/firebase_provider.dart';
import 'package:copick_manage_withweb/select_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckData extends StatelessWidget {
  const CheckData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)  {
    var fbProvider = Provider.of<FbProvider>(context);
    var taskProvider = Provider.of<TaskProvider>(context);
    var size = MediaQuery.of(context).size;
    fbProvider.getLocList();
    fbProvider.getTaskList();
    fbProvider.getWeekDayData();
   
    taskProvider.taskList = fbProvider.taskList;
    taskProvider.locList = fbProvider.locList;
    taskProvider.totalList = fbProvider.weekdayList;
   
    taskProvider.sortData();

    // return AddLocationPage();
    return SelectMenuPage();
  }
}
