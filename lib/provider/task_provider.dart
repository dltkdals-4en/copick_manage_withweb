import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copick_manage_withweb/model/task_record_model.dart';
import 'package:copick_manage_withweb/task_manage/task_manage_page.dart';
import 'package:copick_manage_withweb/model/location_demo.dart';
import 'package:copick_manage_withweb/model/total_task_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../model/pick_task_model.dart';
import '../model/waste_location_model.dart';
import 'fb_helper.dart';

class TaskProvider with ChangeNotifier {
  TextEditingController dateTextController = TextEditingController();
  TextEditingController orderTextController = TextEditingController();
  DateTime dateTime = DateTime.now().add(Duration(days: 1));
  List<WasteLocationModel> locList = [];
  List<PickTaskModel> taskList = [];
  List<WeekdayTaskModel> totalList = [];
  List<TaskRecordModel> recordList = [];
  int trackValue = 0;
  List<int> trackItems = [0, 1, 2, 3];
  FormFieldValidator? validator;
  String? initialName;
  int currentTaskTabIndex = 0;

  List<String> city = ['성수', '안성'];

  String selectedCity = '성수';

  List<String> team = ['A', 'B', 'C'];
  String selectedTeam = 'A';
  List<String> nameList = [];
  List<PickTaskModel> taskListTrack1 = [];
  List<PickTaskModel> taskListTrack2 = [];
  List<PickTaskModel> taskListTrack3 = [];
  List<PickTaskModel> taskListTrack4 = [];
  List<PickTaskModel> taskListTrack5 = [];

  TextEditingController codeTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController latlngController = TextEditingController();
  TextEditingController latTextController = TextEditingController();
  TextEditingController longTextController = TextEditingController();
  TextEditingController adminTextController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController postalController = TextEditingController();
  int? locLat;
  int? locLng;

  TextEditingController trackController = TextEditingController();
  TextEditingController orderController = TextEditingController();
  TextEditingController demoCodeController = TextEditingController();

  TextEditingController modifyCodeController = TextEditingController();
  TextEditingController modifyNameController = TextEditingController();
  TextEditingController modifyAddressController = TextEditingController();
  TextEditingController modifyLatLngController = TextEditingController();
  TextEditingController modifyTelController = TextEditingController();
  TextEditingController modifyPostalController = TextEditingController();
  TextEditingController modifyAdminController = TextEditingController();

  int currentDefaultTabIndex = 1;

  void dateSelect(context) {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
    );
    selectedDate.then((value) {
      dateTime = value!;

      notifyListeners();
    });
  }

  Future<void> addTaskData(FbHelper fbProvider) async {
    currentDefaultTabIndex = 1;
    if (checkValue.where((element) => element == true) == false) {
      print('경로 선택 x');
    } else if (initialName == '' || initialName == '매장 선택') {
      print('매장 선택 x');
    } else {
      var locationId = locList
          .firstWhere((element) => element.locationName == initialName)
          .locationId;
      for (var e in checkValue) {
        e ? 1 : 0;
      }

      var j = WeekdayTaskModel(
        locationId: locationId,
        locationName: getLocName(locationId!),
        trackList: checkValue,
      );
      await fbProvider.addWeekData(j.toMap());
      checkValue.asMap().forEach((key, value) async {
        if (value == true) {
          var i = PickTaskModel(
            track: key + 1,
            failCode: 0,
            failReason: '',
            condition: 0,
            locationId: locationId,
            pickDetails: [],
            pickOrder: 0,
            state: 0,
            totalVolume: 0,
            team: selectedTeam,
            pickUpDate: '',
          );
          await fbProvider.addTaskData(i.toAdd()).then((value) {
            checkValue = [false, false, false, false, false];
            trackValue = 0;
            initialName = null;
            taskList.clear();
          });

          notifyListeners();
        } else {
          print("failed");
        }
      });
    }
  }

  Future<void> addLocData(FbHelper fbProvider) async {
    var latlng = latlngController.value.text.split(',');

    var i = WasteLocationModel(
      locationId: codeTextController.value.text,
      locationAddress: addressTextController.value.text,
      locationGpsLat: (latlngController.value.text.isNotEmpty)
          ? double.parse(latlng.first.trim())
          : 0,
      locationGpsLong: (latlngController.value.text.isNotEmpty)
          ? double.parse(latlng.last.trim())
          : 0,
      locationName: nameTextController.value.text,
      locationPostal: postalController.value.text,
      locationTel: telController.value.text,
      locationAdmin: adminTextController.value.text,
    );

    await fbProvider.addLocDataToAnsung(i.toMap());
    currentTaskTabIndex = 0;
  }

  void clearController() {
    codeTextController.clear();
    nameTextController.clear();
    addressTextController.clear();
    latlngController.clear();
    adminTextController.clear();
    telController.clear();
    postalController.clear();
  }

  void clearModifyController() {
    modifyCodeController.clear();
    modifyNameController.clear();
    modifyAddressController.clear();
    modifyLatLngController.clear();
    modifyAdminController.clear();
    modifyTelController.clear();
    modifyPostalController.clear();
  }

  String getLocName(String id) {
    return (locList.where((element) => element.locationId == id).isNotEmpty)
        ? locList
            .firstWhere((element) => element.locationId == id)
            .locationName!
        : '';
  }

  // Future<void> addDemoData(FbProvider fbProvider) async {
  //   var i = LocationDemo(
  //       locationId: demoCodeController.value.text,
  //       locationAddress: addressTextController.value.text,
  //       locationGpsLat: double.parse(latTextController.value.text),
  //       locationGpsLong: double.parse(longTextController.value.text),
  //       locationName: nameTextController.value.text,
  //       locationPostal: postalController.value.text,
  //       locationTel: telController.value.text,
  //       pickOrder: int.parse(orderController.value.text),
  //       track: int.parse(trackController.value.text));
  //   await fbProvider.addDemoData(i.toMap());
  // }

  Future<void> modifyInfo(
      WasteLocationModel locData, FbHelper fbProvder) async {
    var latlng = modifyLatLngController.value.text.split(',');

    var i = WasteLocationModel(
      locationName: (modifyNameController.value.text.isEmpty)
          ? locData.locationName
          : modifyNameController.value.text,
      locationAddress: (modifyAddressController.value.text.isEmpty)
          ? locData.locationAddress
          : modifyAddressController.value.text,
      locationAdmin: (modifyAdminController.value.text.isEmpty)
          ? locData.locationAdmin
          : modifyAdminController.value.text,
      locationGpsLat: (modifyLatLngController.value.text.isEmpty)
          ? locData.locationGpsLat
          : double.parse(latlng.first.trim()),
      locationGpsLong: (modifyLatLngController.value.text.isEmpty)
          ? locData.locationGpsLong
          : double.parse(latlng.last.trim()),
      locationId: (modifyCodeController.value.text.isEmpty)
          ? locData.locationId
          : modifyCodeController.value.text,
      locationTel: (modifyTelController.value.text.isEmpty)
          ? locData.locationTel
          : modifyTelController.value.text,
      locationPostal: (modifyPostalController.value.text.isEmpty)
          ? locData.locationPostal
          : modifyPostalController.value.text,
      lastCallDate: Timestamp.fromDate(DateTime.now()).toString(),
    );

    await fbProvder.modifyLocData(i.toMap(), locData.locDocId!);
    currentDefaultTabIndex = 0;
  }

  Future<void> deleteLocData(FbHelper fbProvider, String locDocId) async {
    await fbProvider.deleteLocData(locDocId);
    currentDefaultTabIndex = 0;
    notifyListeners();
  }

  void sortData() {
    // taskGrouping();
    totalList.sort((a, b) => a.locationId!.compareTo(b.locationId!));
    taskList.sort((a, b) => a.track!.compareTo(b.track!));
    locList.sort((a, b) => b.locationId!.compareTo(a.locationId!));
    recordList.sort((a, b) => b.pickUpDate!.compareTo(a.pickUpDate!));
    taskListTrack1 = taskList.where((element) => element.track == 1).toList();
    taskListTrack2 = taskList.where((element) => element.track == 2).toList();
    taskListTrack3 = taskList.where((element) => element.track == 3).toList();
    taskListTrack4 = taskList.where((element) => element.track == 4).toList();
    taskListTrack5 = taskList.where((element) => element.track == 5).toList();
    taskListTrack1.sort(
      (a, b) => a.pickOrder!.compareTo(b.pickOrder!),
    );
    taskListTrack2.sort(
      (a, b) => a.pickOrder!.compareTo(b.pickOrder!),
    );
    taskListTrack3.sort(
      (a, b) => a.pickOrder!.compareTo(b.pickOrder!),
    );
    taskListTrack4.sort(
      (a, b) => a.pickOrder!.compareTo(b.pickOrder!),
    );
    taskListTrack5.sort(
      (a, b) => a.pickOrder!.compareTo(b.pickOrder!),
    );
    getNameList();
  }

  void selectedTrack(int? i) {
    trackValue = i!;
    notifyListeners();
  }

  void selectedName(String? i) {
    initialName = i ?? "";
    print(initialName);
    notifyListeners();
  }

  getNameList() {
    if (nameList.isEmpty) {
      for (var value in locList) {
        nameList.add(value.locationName!);

      }
      nameList.sort((a, b) => a.compareTo(b),);
    }
  }

  int mCodeVali = 0;

  void modify(String? text) {
    mCodeVali = 0;
    locList.forEach((element) {
      if (element.locationId == text) mCodeVali++;
    });
  }

  List<bool> checkValue = [false, false, false, false, false];
  List<bool> modifyValue = [false, false, false, false, false];
  List<int> checkValue1 = [1, 1, 1, 1, 1];
  List<String> weekDay = ["월", "화", "수", "목", "금"];
  List<int> testList = [1, 2, 3, 4, 5];

  void valueCheck(int index) {
    if (checkValue[index] == false) {
      checkValue[index] = true;
    } else {
      checkValue[index] = false;
    }

    notifyListeners();
  }

  void modifyCheck(int index) {
    if (modifyValue[index] == false) {
      modifyValue[index] = true;
    } else {
      modifyValue[index] = false;
    }

    notifyListeners();
  }

  void initCheckValue() {
    for (var element in checkValue) {
      element = false;
    }
  }

  void indexChange(int oldIndex, int newIndex, List<PickTaskModel> list) {
    if (newIndex > list.length) {
      newIndex = list.length;
    }
    if (oldIndex < newIndex) {
      newIndex--;
    }
    var item = list[oldIndex];
    list.remove(item);
    list.insert(newIndex, item);
  }

  Future<void> deleteTask(FbHelper fbProvider, String docId,
      TabController taskTabController, int trackIndex) async {
    await fbProvider.deleteTaskData(docId).then((value) {
      currentTaskTabIndex = trackIndex;
    });
  }

  getTrackList(int trackIndex) {
    switch (trackIndex) {
      case 1:
        return taskListTrack1;
      case 2:
        return taskListTrack2;
      case 3:
        return taskListTrack3;
      case 4:
        return taskListTrack4;
      case 5:
        return taskListTrack5;
    }
  }

  // void taskGrouping() {
  //   if (totalList.isEmpty) {
  //     for (var value in taskList) {
  //       // totalList.forEach((element) {
  //       //   if (element.locationId != value.locationId) {
  //       totalList.add(WeekdayTaskModel(
  //           locationId: value.locationId,
  //           locationName: getLocName(value.locationId!),
  //           trackList: [value.track!]));
  //       //   } else {
  //       //     element.trackList?.add(value.track!);
  //       //   }
  //       // });
  //     }
  //     print(totalList);
  //     for (var value1 in totalList) {
  //       if(totalList
  //           .where((element) => element.locationId == value1.locationId).toString().length>2){
  //         print(value1.locationName);
  //       };
  //       print("아래 ${value1.locationName}");
  //     }
  //   }
  // }
  List<String> collectDay = [];

  List<dynamic> changeTrackValue(List<dynamic> trackList) {
    collectDay.clear();
    if (collectDay.isEmpty) {
      trackList.asMap().forEach((key, value) {
        switch (key) {
          case 0:
            if (value == true) collectDay.add("월");

            break;
          case 1:
            if (value == true) collectDay.add("화");

            break;
          case 2:
            if (value == true) collectDay.add("수");

            break;
          case 3:
            if (value == true) collectDay.add("목");
            break;
          case 4:
            if (value == true) collectDay.add("금");

            break;
        }
      });
    }

    return collectDay;
  }

  void updatePickOrder(
      List<PickTaskModel> track, FbHelper fbProvider, int trackIndex) {
    track.asMap().forEach((key, value) async {
      await fbProvider.updatePickOrder({'pick_order': key}, value.pickDocId!);
      currentTaskTabIndex = trackIndex;
    });
  }

  void deleteWeekdayData(int index, FbHelper fbProvider) {
    var data = totalList[index];
    taskList
        .where((element) => element.locationId == data.locationId)
        .forEach((element) {
      data.trackList!.asMap().forEach((key, value) async {
        if (value == true) {
          await fbProvider.deleteTaskFromWeekday();
        } else {}
      });
    });
  }

  void changeTabIndex(int value) {
    currentDefaultTabIndex = value;
    notifyListeners();
  }

  void changeCity(Object? value) {
    selectedCity = value.toString();
    notifyListeners();
  }

  void changeTeam(Object? value) {
    selectedTeam = value.toString();
    notifyListeners();
  }
}
