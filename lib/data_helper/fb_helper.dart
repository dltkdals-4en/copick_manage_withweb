import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copick_manage_withweb/data_helper/enum_helper.dart';
import 'package:copick_manage_withweb/isDebug.dart';
import 'package:copick_manage_withweb/model/pick_task_model.dart';
import 'package:copick_manage_withweb/model/task_record_model.dart';
import 'package:copick_manage_withweb/model/total_task_model.dart';
import 'package:copick_manage_withweb/model/waste_location_model.dart';

class FbHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<WasteLocationModel> locList = [];
  List<PickTaskModel> taskList = [];
  List<WeekdayTaskModel> weekdayList = [];
  List<TaskRecordModel> recordList = [];

  AreaInfo? selectedArea;

  String anseongLoc = 'waste_location_anseong';
  String seongsuLoc = 'waste_location';
  String anseongTask = 'pick_task_anseong';
  String seongsuTask = 'pick_task';

  String? locData;
  String? taskData;

  Future<DocumentSnapshot?> getUserInfo(String username, String password) async{
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('users').where(
          'name', isEqualTo: username)
          .where('password', isEqualTo: password)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first;
      } else {
        return null;
      }
    }catch (e) {
      print("Error getting user data: $e");
      return null;
    }
  }

  void settingArea(AreaInfo areaInfo){
    selectedArea = areaInfo;
  }

  Future<void> addTaskData(Map<String, dynamic> data) async {
    await _firestore
        .collection(selectedArea!.task)
        .doc()
        .set(data);
  }



  Future<void> addTaskDataM(List<PickTaskModel> pickTask) async {
    for (var value in pickTask) {
      await _firestore
          .collection(selectedArea!.task)
          .doc()
          .set(value.toAdd());
    }
  }

  Future<void> addLocData(Map<String, dynamic> map) async {
    await _firestore
        .collection(selectedArea!.waste)
        .doc()
        .set(map);
  }

  Future<void> modifyLocData(Map<String, dynamic> map, String docId) async {
    await _firestore
        .collection(selectedArea!.waste)
        .doc(docId)
        .update(map);
  }

  Future<void> deleteLocData(String docId) async {
    await _firestore
        .collection(selectedArea!.waste)
        .doc(docId)
        .delete();
  }

  Future<void> deleteTaskData(String docId) async {
    await _firestore
        .collection(selectedArea!.task)
        .doc(docId)
        .delete();
  }



  Future<void> updatePickOrder(Map<String, dynamic> map, String docId) async {
    await _firestore
        .collection(selectedArea!.task)
        .doc(docId)
        .update(map);
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getTaskData(String path) async {
    print('fb get $path Data');
    return await _firestore.collection(path).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getLocData(String locPath) async {
    print('fb get $locPath Data');
    return await _firestore.collection(locPath).get();
  }
}
