import 'package:copick_manage_withweb/data_helper/enum_helper.dart';
import 'package:copick_manage_withweb/data_helper/gsheets_api_config.dart';
import 'package:copick_manage_withweb/model/pick_task_model.dart';
import 'package:copick_manage_withweb/data_helper/fb_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

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
  void settingArea(AreaInfo areaInfo){
    selectedArea = areaInfo;
    notifyListeners();
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



  void makeAddList(int? tabIndex) {
    saveWeekAndTeam(tabIndex);
    if (addList.isNotEmpty) {
    } else {
      wasteList?.forEach((element) {
        Map<String, dynamic> e = {'waste': element, 'reserved': false};
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
      addFList = addList.where((element) => element['reserved'] == false).toList();
    } else {
      addFList = addList
          .where((element) => element['reserved'] == false)
          .toList()
          .where((element) =>
              element['waste'].locationName.contains(reserveSearch))
          .toList();
    }
    addTList = addList.where((element) => element['reserved'] == true).toList();
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
      value['reserved'] = false;
    }
    getAddList();
    notifyListeners();
  }

  void changeState(Map<String, dynamic> item) {
    item['reserved'] = !item['reserved'];
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

  Future<void> addReserve() async {
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
    await FbHelper().addTaskDataM(reserveList,selectedArea).then((value) {
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
      addFList = addList.where((element) => element['reserved'] == false).toList();
      notifyListeners();
    } else {
      addFList = addList
          .where((element) => element['reserved'] == false)
          .toList()
          .where((element) => element['waste'].locationName.contains(value))
          .toList();
      notifyListeners();
    }
  }
  bool reserveValidation(){
    if(selectedWeek == null || selectedTeam == null){
      return false;
    }else{
      return true;
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
        value['reserved'] = false;
      }
    }
    getAddList();
    notifyListeners();
  }
  Future<void> deleteTask(String? pickDocId) async{
    await FbHelper().deleteTaskData(pickDocId!,selectedArea);
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
      await FbHelper().deleteTaskData(value.pickDocId!,selectedArea);
    }
    notifyListeners();
  }
  int getMaxCode(){
    return int.parse(locList!.reduce((a, b) => int.parse(a.locationId!)>int.parse(b.locationId!)?a:b).locationId!);

  }
  String convertTeam(String teamName) {
    int teamNum = (double.parse(teamName)/10 -1).toInt();

    return team[teamNum];
  }
  Spreadsheet? spreadsheet;
Worksheet? worksheet;
  void getGsheets() async{
    // final gsheets = GsheetsApiConfig.gsheets;
    // spreadsheet = await gsheets.spreadsheet('1fhax62kIyddAu6J8Dqu3OAw1j1E8kqZgh4gxXvQ0uJM');
    // worksheet = await spreadsheet!.worksheetByTitle('시트5');
    // for(var i = 1; i<60; i ++){
    // var data = await worksheet!.values.row(i);
    var data1 = WasteLocationModel(
      locationId: '1074',
      locationName: '이마트24(본점)',
      locationGpsLat: 37.54787,
      locationGpsLong: 127.06431,
    ).toMap();
    await FbHelper().addLocData(data1,selectedArea);
    // }

    // print(worksheet);
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
