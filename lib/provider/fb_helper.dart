import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copick_manage_withweb/isDebug.dart';
import 'package:copick_manage_withweb/model/pick_task_model.dart';
import 'package:copick_manage_withweb/model/task_record_model.dart';
import 'package:copick_manage_withweb/model/total_task_model.dart';
import 'package:copick_manage_withweb/model/waste_location_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FbHelper with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<WasteLocationModel> locList = [];
  List<PickTaskModel> taskList = [];
  List<WeekdayTaskModel> weekdayList = [];
  List<TaskRecordModel> recordList = [];

  String anseongLoc = 'waste_location_anseong';
  String seongsuLoc = 'waste_location';
  String anseongTask = 'pick_task_anseong';
  String seongsuTask = 'pick_task';

  String? locData;
  String? taskData;



  Future<void> addTaskData(Map<String, dynamic> data) async {
    await _firestore
        .collection((isAnseong) ? anseongTask : seongsuTask)
        .doc()
        .set(data);
  }

  Future<void> addTaskDataM(List<PickTaskModel> pickTask) async {
    for (var value in pickTask) {
      await _firestore
          .collection((isAnseong) ? anseongTask : seongsuTask)
          .doc()
          .set(value.toAdd());
    }
  }

  Future<void> addWeekData(Map<String, dynamic> data) async {
    await _firestore
        .collection('pick_task_weekday_anseong')
        .doc()
        .set(data)
        .then((value) {
      notifyListeners();
    });
  }

  Future<void> addLocData(Map<String, dynamic> map) async {
    await _firestore
        .collection((isAnseong) ? anseongLoc : seongsuLoc)
        .doc()
        .set(map)
        .then((value) {
      notifyListeners();
    });
  }

  Future<void> modifyLocData(Map<String, dynamic> map, String docId) async {
    await _firestore
        .collection((isAnseong) ? anseongLoc : seongsuLoc)
        .doc(docId)
        .update(map)
        .then((value) {
      notifyListeners();
    });
  }

  Future<void> deleteLocData(String docId) async {
    await _firestore
        .collection((isAnseong) ? anseongLoc : seongsuLoc)
        .doc(docId)
        .delete()
        .then((value) {
      notifyListeners();
    });
  }

  Future<void> deleteTaskData(String docId) async {
    await _firestore
        .collection((isAnseong) ? anseongTask : seongsuTask)
        .doc(docId)
        .delete()
        .then((value) {
      notifyListeners();
    });
  }

  Future<void> updatePickOrder(Map<String, dynamic> map, String docId) async {
    await _firestore
        .collection((isAnseong) ? anseongTask : seongsuTask)
        .doc(docId)
        .update(map)
        .then((value) {
      notifyListeners();
    });
  }

  // deleteDummyData(List<PickTaskModel> taskList) async {
  //   for (var value in taskList) {
  //     await _firestore.collection(anseongTask).doc(value.pickDocId).delete();
  //   }
  //   notifyListeners();
  // }
  Future<void> addDummyTaskData(List<PickTaskModel> taskList) async {
    for (var value in taskList) {
      await _firestore.collection('anseong_task_dummy').add(value.toAdd());
    }
  }

  Future<void> updateTeamToInt(List<PickTaskModel> taskList) async {
    for (var element in taskList) {
      print(element.team);
      var team = 0;
      switch (element.team) {
        case 'A':
          team = 10;
          break;
        case 'B':
          team = 20;
          break;
        case 'C':
          team = 30;
          break;
        case '추가':
          team = 40;
      }
      await _firestore
          .collection(anseongTask)
          .doc(element.pickDocId)
          .update({'team': team});
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getLocData(String locPath) async {
    print('fb get $locPath Data');
    return await _firestore.collection(locPath).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getTaskData(String path) async {
    print('fb get $path Data');
    return await _firestore.collection(path).get();
  }
}
