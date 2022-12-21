import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copick_manage_withweb/model/pick_task_model.dart';
import 'package:copick_manage_withweb/model/task_record_model.dart';
import 'package:copick_manage_withweb/model/total_task_model.dart';
import 'package:copick_manage_withweb/model/waste_location_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FbProvider with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<WasteLocationModel> locList = [];
  List<PickTaskModel> taskList = [];
  List<WeekdayTaskModel> weekdayList = [];
  List<TaskRecordModel> recordList = [];
  bool hasLocData = false;
  bool hasTaskData = false;
  bool hasWeekdayData = false;
  bool hasRecordData = false;

  Future<void> getLocList() async {
    if (hasLocData == false) {
      QuerySnapshot<Map<String, dynamic>> data =
          await _firestore.collection('waste_location').get();
      locList.clear();
      for (var element in data.docs) {
        locList.add(WasteLocationModel.fromJson(element.data(), element.id));
      }
      hasLocData = true;
      notifyListeners();
    }
  }

  Future<void> getTaskList() async {
    print(hasTaskData);
    if (hasTaskData == false) {
      print('task : $hasTaskData');

      QuerySnapshot<Map<String, dynamic>> data =
          await _firestore.collection('pick_task').get();
      taskList.clear();
      for (var element in data.docs) {
        taskList.add(PickTaskModel.fromJson(element.data(), element.id));
      }
      hasTaskData = true;
      notifyListeners();
    }
  }

  Future<void> getRecordData() async {
    print('record');
    if (hasRecordData == false) {
      QuerySnapshot<Map<String, dynamic>> data =
          await _firestore.collection('pick_task_demo').get();
      recordList.clear();
      for (var value in data.docs) {
        recordList.add(TaskRecordModel.fromJson(value.data(), value.id));
        notifyListeners();
      }
      hasRecordData = true;
      notifyListeners();
    }
  }

  Future<void> getWeekDayData() async {
    if (hasWeekdayData == false) {
      QuerySnapshot<Map<String, dynamic>> data =
          await _firestore.collection('pick_task_weekday').get();
      weekdayList.clear();
      for (var value in data.docs) {
        weekdayList.add(WeekdayTaskModel.fromJson(value.data(), value.id));
      }
      hasWeekdayData = true;
      notifyListeners();
    }
  }

  Future<void> addTaskData(Map<String, dynamic> data) async {
    await _firestore.collection('pick_task').doc().set(data).then((value) {
      hasTaskData = false;
      hasLocData = false;
      hasWeekdayData = false;
      notifyListeners();
    });
  }

  Future<void> addWeekData(Map<String, dynamic> data) async {
    await _firestore
        .collection('pick_task_weekday')
        .doc()
        .set(data)
        .then((value) {
      hasTaskData = false;
      hasLocData = false;
      hasWeekdayData = false;
      notifyListeners();
    });
  }

  Future<void> addLocData(Map<String, dynamic> map) async {
    await _firestore.collection('waste_location').doc().set(map).then((value) {
      hasTaskData = false;
      hasLocData = false;
      hasWeekdayData = false;
      notifyListeners();
    });
  }

  Future<void> addDemoData(Map<String, dynamic> map) async {
    await _firestore.collection('location_demo').doc().set(map).then((value) {
      hasTaskData = false;
      hasLocData = false;
      hasWeekdayData = false;
      notifyListeners();
    });
  }

  Future<void> modifyLocData(Map<String, dynamic> map, String docId) async {
    await _firestore
        .collection('waste_location')
        .doc(docId)
        .update(map)
        .then((value) {
      hasTaskData = false;
      hasLocData = false;
      hasWeekdayData = false;
      notifyListeners();
    });
  }

  Future<void> deleteLocData(String docId) async {
    await _firestore
        .collection('waste_location')
        .doc(docId)
        .delete()
        .then((value) {
      hasTaskData = false;
      hasLocData = false;

      notifyListeners();
    });
  }

  Future<void> deleteTaskData(String docId) async {
    await _firestore.collection('pick_task').doc(docId).delete().then((value) {
      hasTaskData = false;
      hasLocData = false;

      notifyListeners();
    });
  }

  Future<void> updatePickOrder(Map<String, dynamic> map, String docId) async {
    await _firestore
        .collection('pick_task')
        .doc(docId)
        .update(map)
        .then((value) {
      hasTaskData = false;
      hasLocData = false;
      hasWeekdayData = false;
      notifyListeners();
    });
  }

  deleteTaskFromWeekday() {}
}
