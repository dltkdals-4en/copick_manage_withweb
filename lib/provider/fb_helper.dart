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
  bool hasLocData = false;
  bool hasTaskData = false;
  bool hasWeekdayData = false;
  bool hasRecordData = false;

  String anseongLoc = 'waste_location_anseong';
  String seongsuLoc = 'waste_location';
  String anseongTask = 'pick_task_anseong';
  String seongsuTask = 'pick_task';

  String? locData;
  String? taskData;

//   void firebaseName(Area area){
//     switch (area){
//       case Area.seongdong:
//         locData = 'waste_loation';
//         taskData = 'pick_task';
//         notifyListeners();
//         break;
//       case Area.anseong:
//         locData = 'waste_loation_anseong';
//         taskData = 'pick_task_anseong';
//         notifyListeners();
//         break;
//     }
// }

  Future<void> getLocList() async {
    // firebaseName(area);
    if (hasLocData == false) {
      print('getLoc()');
      QuerySnapshot<Map<String, dynamic>> data = await _firestore
          .collection((isAnseong) ? anseongLoc : seongsuLoc)
          .get();
      locList.clear();
      for (var element in data.docs) {
        locList.add(WasteLocationModel.fromJson(element.data(), element.id));
      }
      hasLocData = true;
      notifyListeners();
    }
  }

  Future<void> getTaskList() async {
    if (hasTaskData == false) {
      print('getTask()');
      taskList.clear();
      await _firestore.collection(anseongTask).get().then((data) {
        print(data.docs.length);
        for (var element in data.docs) {
          // String locationId = locList
          //         .firstWhere(
          //           (e) => e.locationName == element.data()['location_name'],
          //           orElse: () => WasteLocationModel(locationId: '알수 없음'),
          //         )
          //         .locationId ??
          //     '';
          taskList.add(
              PickTaskModel.fromJson(element.data(), element.id));
        }
        print(taskList.length);
        hasTaskData = true;
        notifyListeners();
      });
    }
  }

  Future<void> getSeongsuTask() async {
    var startDate = DateFormat('yy-MM-dd hh:mm:ss').parse((getMonth >= 10)
        ? '$getYear-$getMonth-01 00:00:00'
        : '$getYear-0$getMonth-01 00:00:00');
    var endDate = DateFormat('yy-MM-dd hh:mm:ss').parse((getMonth >= 10)
        ? '$getYear-${getMonth + 1}-01 00:00:00'
        : '$getYear-0${getMonth + 1}-01 00:00:00');
    if (hasTaskData == false) {
      print('getSeongSuTask()');

      await _firestore
          .collection(seongsuTask)
          .where('pick_up_date', isGreaterThan: startDate)
          .where('pick_up_date', isLessThan: endDate)
          .get()
          .then((value) {
        taskList.clear();
        for (var element in value.docs) {
          String locationId = locList
                  .firstWhere(
                    (e) => e.locationName == element.data()['location_name'],
                    orElse: () => WasteLocationModel(locationId: '알수 없음'),
                  )
                  .locationId ??
              '';
          if (!element.data()['location_name'].toString().contains('수거')) {
            taskList.add(
                PickTaskModel.fromJson(element.data(), element.id));
          }
        }
        hasTaskData = true;
        notifyListeners();
      });
    }
  }

  Future<void> getRecordData() async {
    print('record');
    if (hasRecordData == false) {
      QuerySnapshot<Map<String, dynamic>> data = await _firestore
          .collection((isAnseong) ? anseongTask : seongsuTask)
          .orderBy('pick_up_date', descending: true)
          .limit(100)
          .get();
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
    await _firestore
        .collection((isAnseong) ? anseongTask : seongsuTask)
        .doc()
        .set(data)
        .then((value) {
      hasTaskData = false;
      hasLocData = false;
      hasWeekdayData = false;
      notifyListeners();
    });
  }

  Future<void> addWeekData(Map<String, dynamic> data) async {
    await _firestore
        .collection('pick_task_weekday_anseong')
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
    await _firestore
        .collection((isAnseong) ? anseongLoc : seongsuLoc)
        .doc()
        .set(map)
        .then((value) {
      hasTaskData = false;
      hasLocData = false;
      hasWeekdayData = false;
      notifyListeners();
    });
  }

  Future<void> modifyLocData(Map<String, dynamic> map, String docId) async {
    await _firestore
        .collection((isAnseong) ? anseongLoc : seongsuLoc)
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
        .collection((isAnseong) ? anseongLoc : seongsuLoc)
        .doc(docId)
        .delete()
        .then((value) {
      hasTaskData = false;
      hasLocData = false;

      notifyListeners();
    });
  }

  Future<void> deleteTaskData(String docId) async {
    await _firestore
        .collection((isAnseong) ? anseongTask : seongsuTask)
        .doc(docId)
        .delete()
        .then((value) {
      hasTaskData = false;
      hasLocData = false;

      notifyListeners();
    });
  }

  Future<void> updatePickOrder(Map<String, dynamic> map, String docId) async {
    await _firestore
        .collection((isAnseong) ? anseongTask : seongsuTask)
        .doc(docId)
        .update(map)
        .then((value) {
      hasTaskData = false;
      hasLocData = false;
      hasWeekdayData = false;
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
