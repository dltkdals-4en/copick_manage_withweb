import 'package:copick_manage_withweb/data_helper/enum_helper.dart';
import 'package:flutter/cupertino.dart';

import '../model/task_model.dart';
import '../model/waste_location_model.dart';

class UiProvider with ChangeNotifier{
  AreaInfo? selectedArea;
  List<WasteLocationModel>? wasteList;
  List<TaskModel>? taskList;
  List<WasteLocationModel>? locList;
  int? taskIndex;
  List<TaskModel>? taskDayList;
  PageController teamPageController = PageController();

  void changeLocList(String? value){
    if(value ==null){
      locList = wasteList;
      notifyListeners();
    }else{
      locList = wasteList!.where((element) => element.locationName!.contains(value)).toList();
      notifyListeners();
    }
  }

  void sortLocList(List<WasteLocationModel> locList) {
    wasteList = locList;
    wasteList!.sort((a, b) => a.locationId!.compareTo(b.locationId!),);

  }



  String getWeekDay(int index) {
    var weekday = index + 1;
    switch (weekday){
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
    return taskList!.where((element) => element.track == index+1).length.toString();
  }

  void saveTaskIndex(int index) {
    taskDayList = taskList!.where((element) => element.track == index+1).toList();
    print('taskDay : ${taskDayList!.length}');
    notifyListeners();
  }

  String getLocName(String? locationId) {
    return wasteList!.firstWhere((element) => element.locationId == 'S$locationId').locationName??'';
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