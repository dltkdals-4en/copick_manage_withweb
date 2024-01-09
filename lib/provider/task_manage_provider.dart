import 'package:copick_manage_withweb/data_helper/enum_helper.dart';
import 'package:copick_manage_withweb/model/pick_task_model.dart';
import 'package:copick_manage_withweb/provider/fb_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
  List<List<TaskModel>>? teamList = [[], [], [], []];
  List<String> weekDay = ['월', '화', '수', '목', '금'];
  String? selectedWeek;

  List<String> team = ['A', 'B', 'C', '센서'];
  String? selectedTeam;
  List<Map<String, dynamic>> addList = [];
  List<Map<String, dynamic>> addTList = [];
  List<Map<String, dynamic>> addFList = [];

  String? reserveSearch;

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
    print('saveTaskINdex weekday -> $index');
    taskDayList =
        taskList!.where((element) => element.track == index + 1).toList();
    selectedDay = index + 1;
    print('taskDay : ${taskDayList!.length} // selectedDay = $selectedDay');
    notifyListeners();
  }

  void getDayList(int index) {
    print('getDayList');
    print('task -> ${taskList!.length}');
    taskDayList = taskList!.where((element) => element.track == index).toList();
    getTeamList();
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
    taskDayB = taskDayList!
        .where((element) => element.team == '20' || element.team == 'B')
        .toList();
    taskDayC = taskDayList!
        .where((element) => element.team == '30' || element.team == 'C')
        .toList();
    taskDayAdd = taskDayList!
        .where((element) => element.team == '40' || element.team == '추가')
        .toList();
    teamList = [taskDayA!, taskDayB!, taskDayC!, taskDayAdd!];
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
      searchList = taskDayTotal!
          .where((element) => element.locationName!.contains(value))
          .toList();
      notifyListeners();
    }
  }

  int getAddedTaskLength(int index) {
    return taskList
            ?.where((element) =>
                element.track == index + 1 && element.team == '40' ||
                element.team == '추가')
            .length ??
        0;
  }

  void deleteTask() {
    notifyListeners();
  }

  void makeAddList(int? tabIndex) {
    saveWeekAndTeam(tabIndex);
    if (addList.isNotEmpty) {
    } else {
      wasteList?.forEach((element) {
        Map<String, dynamic> e = {'waste': element, 'state': false};
        addList.add(e);
        addList.sort((a, b) =>
            a['waste'].locationName.compareTo(b['waste'].locationName));
        getAddList();
        notifyListeners();
      });
    }
  }

  void saveWeekAndTeam(int? tabIndex) {
    if (selectedDay != null && tabIndex != null) {
      selectedWeek = getWeekDay(selectedDay! - 1);
      selectedTeam = team[tabIndex];
    }
    if (kDebugMode) {
      print('$selectedWeek -- $selectedTeam');
    }
    notifyListeners();
  }

  void getAddList() {
    if (reserveSearch == null || reserveSearch == '') {
      addFList = addList.where((element) => element['state'] == false).toList();
    } else {
      addFList = addList
          .where((element) => element['state'] == false)
          .toList()
          .where((element) =>
              element['waste'].locationName.contains(reserveSearch))
          .toList();
    }
    addTList = addList.where((element) => element['state'] == true).toList();
  }

  void changeWeek(Object? value) {
    selectedWeek = value.toString();
    if (addTList.isNotEmpty) {
      overlapValidationTotal();
    }
    print(selectedWeek);
    notifyListeners();
  }

  void changeTeam(Object? value) {
    selectedTeam = value.toString();
    notifyListeners();
  }

  void initReserve() {
    for (var value in addList) {
      value['state'] = false;
    }
    getAddList();
    notifyListeners();
  }

  void changeState(Map<String, dynamic> item) {
    item['state'] = !item['state'];
    getAddList();
    notifyListeners();
  }

  int addValidation(locationId) {
    if (selectedTeam == null || selectedWeek == null) {
      return 0;
    } else if (overlapValidation(locationId)) {
      return 1;
    } else {
      return 2;
    }
  }

  Future<void> addReserve(FbHelper fbHelper) async {
    var track = weekDay.indexOf(selectedWeek!) + 1;
    var teamNum = (team.indexOf(selectedTeam!) + 1) * 10;

    List<PickTaskModel> reserveList = [];
    if (reserveList.isNotEmpty) reserveList.clear();
    for (var value in addTList) {
      reserveList.add(PickTaskModel(
        locationId: value['waste'].locationId,
        track: track,
        team: teamNum.toString(),
        pickOrder: 0,
      ));
    }
    await fbHelper.addTaskDataM(reserveList).then((value) {
      selectedTeam = null;
      selectedWeek = null;
      initReserve();
      notifyListeners();
    });
  }

  void searchCafe(String value) {
    print('value = $value');
    reserveSearch = value;
    if (value == '' || value.isEmpty) {
      addFList = addList.where((element) => element['state'] == false).toList();
      notifyListeners();
    } else {
      addFList = addList
          .where((element) => element['state'] == false)
          .toList()
          .where((element) => element['waste'].locationName.contains(value))
          .toList();
      notifyListeners();
    }
  }

  bool overlapValidation(locationId) {
    var track = weekDay.indexOf(selectedWeek!) + 1;
    if (taskList!
        .where((element) => element.track == track)
        .where((element) => locationId.contains(element.locationId))
        .isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void overlapValidationTotal() {
    var track = weekDay.indexOf(selectedWeek!) + 1;
    var list = taskList!.where((element) => element.track == track);

    for (var value in addList) {
      if (list
          .where((element) =>
              value['waste'].locationId.contains(element.locationId))
          .isNotEmpty) {
        value['state'] = false;
      }
    }
    getAddList();
    notifyListeners();
  }

  Future<void> deleteWithWeekTeam(tabIndex) async{
    saveWeekAndTeam(tabIndex);
    var track = weekDay.indexOf(selectedWeek!) + 1;
    var teamNum = (team.indexOf(selectedTeam!) + 1) * 10;
    var deleteList = taskList!
        .where((element) =>
            element.team == teamNum.toString() && element.track == track)
        .toList();
    for (var value in deleteList) {
      await FbHelper().deleteTaskData(value.pickDocId!);
    }
    notifyListeners();
  }

  String convertTeam(String teamName) {
    int teamNum = (double.parse(teamName)/10 -1).toInt();

    return team[teamNum];
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
