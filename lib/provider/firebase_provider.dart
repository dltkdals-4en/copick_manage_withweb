import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copick_manage_withweb/model/pick_task_model.dart';
import 'package:copick_manage_withweb/model/waste_location_model.dart';
import 'package:flutter/material.dart';

class FbProvider with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<WasteLocationModel> locList = [];
  List<PickTaskModel> taskList = [];
  bool hasLocData = false;
  bool hasTaskData = false;

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

  Future<void> addTaskData(Map<String, dynamic> data) async {
    await _firestore.collection('pick_task').doc().set(data).then((value) {
      hasTaskData = false;
      hasLocData = false;

      notifyListeners();
    });

    print(hasTaskData);
  }
}
