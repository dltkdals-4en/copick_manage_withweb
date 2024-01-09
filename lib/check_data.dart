// import 'package:copick_manage_withweb/constants/loading_screen.dart';
// import 'package:copick_manage_withweb/provider/task_provider.dart';
// import 'package:copick_manage_withweb/provider/fb_helper.dart';
// import 'package:copick_manage_withweb/select_menu_page.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class CheckData extends StatelessWidget {
//   const CheckData({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var fbProvider = Provider.of<FbHelper>(context);
//     var taskProvider = Provider.of<TaskProvider>(context);
//     var size = MediaQuery.of(context).size;
//
//     if (fbProvider.hasLocData == false) {
//       fbProvider.getLocList();
//       return const LoadingScreen();
//     } else if (fbProvider.hasTaskData == false) {
//      fbProvider.getTaskList();
//       return const LoadingScreen();
//     // } else if (fbProvider.hasWeekdayData == false) {
//     //   fbProvider.getWeekDayData();
//     //   return LoadingScreen();
//     // }else if (fbProvider.hasRecordData ==false){
//     //   fbProvider.getRecordData();
//     //   return LoadingScreen();
//     }
//     else {
//       taskProvider.taskList = fbProvider.taskList;
//       taskProvider.locList = fbProvider.locList;
//       taskProvider.totalList = fbProvider.weekdayList;
//      taskProvider.sortData();
//
//       // return (isAnseong)?SelectMenuPage():SeongsuHomePage();
//       return const SelectMenuPage();
//     }
//   }
// }
