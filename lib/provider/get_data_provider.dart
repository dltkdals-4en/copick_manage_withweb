import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copick_manage_withweb/data_helper/fb_helper.dart';
import 'package:flutter/material.dart';
import '../data_helper/enum_helper.dart';
import '../data_helper/http_helper.dart';
import '../model/task_model.dart';
import '../model/waste_location_model.dart';

class GetDataProvider with ChangeNotifier {
  AreaInfo? areaInfo;
  bool haveLoc = false;
  bool haveTask = false;
  List<WasteLocationModel> locList = [];
  List<TaskModel> taskList = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  void changeArea(AreaInfo area) {
    areaInfo = area;
    notifyListeners();
  }

  Future<bool> getLocData() async {
    print('1 -> $haveLoc');
    if (!haveLoc) {
      //   if (areaInfo != null) {
      print('${areaInfo!.waste} data loading');
      if (areaInfo == AreaInfo.Anseong) {
        print('http data');
        await getHttpLocData();
      } else {
        print('firebase data ');
        var i = await _firestore.collection(areaInfo!.waste).get();
        if (i.size > 0) {
          locList.clear();
          await Future.forEach(i.docs, (element) {
            locList
                .add(WasteLocationModel.fromJson(element.data(), element.id));
          });
          print('loclist -> ${locList.length}');
          haveLoc = true;
          notifyListeners();
        }
      }
      // }
    }
    print('2 -> $haveLoc');
    return haveLoc;
  }

  Future<void> getHttpLocData() async {
    if (!haveLoc) {
      if (areaInfo != null) {
        print('${areaInfo!.waste} data loading');
        if (!haveLoc) {
          await HttpHelper().getCafeInfo(areaInfo!.api).then((value) async {
            locList.clear();
            for (var element in value) {
              locList.add(WasteLocationModel.fromHttpJson(element));
            }
            print('loclist -> ${locList.length}');
            haveLoc = true;
            notifyListeners();
          });
        } else {
          print('Area empty');
        }
      }
    }
  }

  Future<void> getTaskData() async {
    if (!haveTask) {
      if (areaInfo != null) {
        print('${areaInfo!.task} data loading');
        if (!haveTask) {
          await FbHelper().getTaskData(areaInfo!.task).then((value) {
            taskList.clear();
            for (var element in value.docs) {
              String locName = locList
                      .firstWhere(
                          (e) => e.locationId == element.data()['location_id'])
                      .locationName ??
                  '';
              taskList
                  .add(TaskModel.fromJson(element.data(), locName, element.id));
            }
            print('tasklist -> ${taskList.length}');
            haveTask = true;
            notifyListeners();
          });
        }
      } else {
        print('task empty');
      }
    }
  }

  Future<void> insertLocData() async {}

  Future<void> updateLocData() async {}

  Future<void> deleteLocData() async {}

  Future<void> insertTaskData() async {}

  Future<void> updateTaskData() async {}

  Future<void> deleteTaskData(String docId) async {
    await FbHelper().deleteTaskData(docId, areaInfo).then((value) async {
      await FbHelper().getTaskData(areaInfo!.task).then((value) {
        taskList.clear();
        for (var element in value.docs) {
          String locName = locList
                  .firstWhere(
                      (e) => e.locationId == element.data()['location_id'])
                  .locationName ??
              '';
          taskList.add(TaskModel.fromJson(element.data(), locName, element.id));
        }
        print('tasklist -> ${taskList.length}');
        haveTask = true;
        notifyListeners();
      });
    });
  }

  void error() {}

  void init() {
    haveLoc = false;
    haveTask = false;
    areaInfo = null;
    notifyListeners();
  }

  Future<void> initTask() async {
    await FbHelper().getTaskData(areaInfo!.task).then((value) {
      taskList.clear();
      for (var element in value.docs) {
        String locName = locList
                .firstWhere(
                    (e) => e.locationId == element.data()['location_id'])
                .locationName ??
            '';
        taskList.add(TaskModel.fromJson(element.data(), locName, element.id));
      }
      print('tasklist -> ${taskList.length}');
      haveTask = true;
      notifyListeners();
    });
    notifyListeners();
  }
}
