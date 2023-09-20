import 'package:copick_manage_withweb/provider/fb_helper.dart';
import 'package:flutter/material.dart';
import '../data_helper/enum_helper.dart';
import '../model/task_model.dart';
import '../model/waste_location_model.dart';

class GetDataProvider with ChangeNotifier {
  AreaInfo? areaInfo;
  bool haveLoc = false;
  bool haveTask = false;
  List<WasteLocationModel> locList = [];
  List<TaskModel> taskList = [];

  void changeArea(AreaInfo area) {
    areaInfo = area;
    notifyListeners();
  }

  Future<void> getLocData() async {
    if (!haveLoc) {
      if (areaInfo != null) {
        print('${areaInfo!.waste} data loading');
        if (!haveLoc) {
          locList.clear();
          await FbHelper().getLocData(areaInfo!.waste).then((value) {
            for (var element in value.docs) {
              locList
                  .add(WasteLocationModel.fromJson(element.data(), element.id));
            }
          }).then((value) {
            print('loclist -> ${locList.length}');
            haveLoc = true;
            notifyListeners();
          });
        }
      } else {
        print('Area empty');
      }
    }
  }

  Future<void> getTaskData() async {
    if (!haveTask) {
      if (areaInfo != null) {
        print('${areaInfo!.task} data loading');
        if (!haveTask) {
          taskList.clear();
          await FbHelper().getTaskData(areaInfo!.task).then((value) {
            for (var element in value.docs) {
              taskList.add(TaskModel.fromJson(element.data(), element.id));
            }
          }).then((value) {
            print('tasklist -> ${taskList.length}');
            haveTask = true;
            notifyListeners();
          });
        }
      } else {
        print('Area empty');
      }
    }
  }

  Future<void> insertLocData() async {}

  Future<void> updateLocData() async {}

  Future<void> deleteLocData() async {}

  Future<void> insertTaskData() async {}

  Future<void> updateTaskData() async {}

  Future<void> deleteTaskData() async {}

  void error() {}

  void init() {
    haveLoc = false;
    haveTask = false;
    areaInfo = null;
  }
}
