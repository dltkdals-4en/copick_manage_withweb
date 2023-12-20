import 'package:copick_manage_withweb/data_helper/enum_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/task_model.dart';
import '../model/waste_location_model.dart';

class TaskManageProvider with ChangeNotifier {
  AreaInfo? selectedArea;
  List<WasteLocationModel>? wasteList;
  List<TaskModel>? taskList;
  List<WasteLocationModel>? locList;
  int? taskIndex;
  List<TaskModel>? taskDayList;
  List<TaskModel>? taskDayTotal;
  List<TaskModel>? taskDayA;
  List<TaskModel>? taskDayB;
  List<TaskModel>? taskDayC;
  List<TaskModel>? taskDayAdd;
  PageController teamPageController = PageController();
  List<String> tabTitle = [];
  int? selectedDay;
  String? searchText;
  List<TaskModel>? searchList = [];
  List<List<TaskModel>>? teamList =[[],[],[],[]];

  void changeLocList(String? value) {
    if (value == null) {
      locList = wasteList;
      notifyListeners();
    } else {
      locList = wasteList!
          .where((element) => element.locationName!.contains(value))
          .toList();
      notifyListeners();
    }
  }

  void sortLocList(List<WasteLocationModel> locList) {
    wasteList = locList;
    wasteList!.sort(
      (a, b) => a.locationId!.compareTo(b.locationId!),
    );
  }

  String getWeekDay(int index) {
    var weekday = index + 1;
    switch (weekday) {
      case 1:
        return '월';
      case 2:
        return '화';
      case 3:
        return '수';
      case 4:
        return '목';
      case 5:
        return '금';
      default:
        return '';
    }
  }

  String getTaskLength(int index) {
    return taskList!
        .where((element) => element.track == index + 1)
        .length
        .toString();
  }

  void saveTaskIndex(int index) {
    taskDayList =
        taskList!.where((element) => element.track == index + 1).toList();
    selectedDay = index + 1;
    print('taskDay : ${taskDayList!.length}');
    notifyListeners();
  }

  String getLocName(String? locationId) {
    return wasteList!
            .firstWhere((element) => element.locationId == 'S$locationId')
            .locationName ??
        '';
  }

  List<TaskModel> getList(int tabIndex, String? searchText) {
    switch (tabIndex) {

      case 0:
        return taskDayList!
            .where((element) => element.team == '10' || element.team == 'A')
            .toList();

      case 1:
        return taskDayList!
            .where((element) => element.team == '20' || element.team == 'B')
            .toList();
      case 2:
        return taskDayList!
            .where((element) => element.team == '30' || element.team == 'C')
            .toList();
      case 3:
        return taskDayList!
            .where((element) => element.team == '40' || element.team == '추가')
            .toList();
      default:
        return taskDayList!;
    }
  }
  void getTeamList() {
   taskDayTotal = taskDayList;
   taskDayA = taskDayList!
       .where((element) => element.team == '10' || element.team == 'A')
       .toList();
   taskDayB =  taskDayList!
       .where((element) => element.team == '20' || element.team == 'B')
       .toList();
   taskDayC =taskDayList!
       .where((element) => element.team == '30' || element.team == 'C')
       .toList();
   taskDayAdd =taskDayList!
       .where((element) => element.team == '40' || element.team == '추가')
       .toList();
   teamList = [taskDayA!, taskDayB!, taskDayC!, taskDayAdd! ];
   notifyListeners();
  }

  String? getMaxId() {
    return taskDayList!.reduce((a, b) {
      if (int.parse(a.locationId!) > int.parse(b.locationId!)) {
        return a;
      }
      return b;
    }).locationId;
  }

  void deleteAllTask() {
    for (var element in taskDayList!) {
      // FbHelper().deleteTaskData(element.)
    }
  }

  void search(String? value) {

    if (value == null || value == '') {
     searchList = [];
     notifyListeners();
    } else {
      searchList = taskDayTotal!.where((element) => element.locationName!.contains(value)).toList();
      notifyListeners();
    }
  }



  int getAddedTaskLength(int index) {
    return taskList?.where((element) => element.track == index+1 && element.team == '40' || element.team == '추가').length??0;
  }

  void deleteTask() {
    notifyListeners();
  }



// void search(String value) {
//   print(value);
//   wasteList = wasteList!.where((element) => element.locationName!.contains(value)).toList();
//   wasteList?.forEach((element) {
//     print(element.locationName);
//   });
//   notifyListeners();
// }
}
