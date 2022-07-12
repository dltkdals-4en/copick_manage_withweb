import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copick_manage_withweb/model/location_demo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../model/pick_task_model.dart';
import '../model/waste_location_model.dart';
import 'firebase_provider.dart';

class TaskProvider with ChangeNotifier {
  TextEditingController dateTextController = TextEditingController();
  TextEditingController orderTextController = TextEditingController();
  DateTime dateTime = DateTime.now().add(Duration(days: 1));
  List<WasteLocationModel> locList = [];
  List<PickTaskModel> taskList = [];
  int trackValue = 0;
  List<int> trackItems = [0, 1, 2, 3];
  FormFieldValidator? validator;
  String initialName = "";
  List<String> nameList = [];
  List<PickTaskModel> taskListTrack1 = [];
  List<PickTaskModel> taskListTrack2 = [];
  List<PickTaskModel> taskListTrack3 = [];

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

  void dateSelect(context) {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
    );
    selectedDate.then((value) {
      dateTime = value!;
      print(dateTime);
      notifyListeners();
    });
    print(dateTime);
  }

  Future<void> addTaskData(FbProvider fbProvider) async {

    if (checkValue.where((element) => element == true) == false) {
      print('경로 선택 x');
    } else if (initialName == '' || initialName == '매장선택') {
      print('매장 선택 x');
    } else {
      var locationId = locList
          .firstWhere((element) => element.locationName == initialName)
          .locationId;
      print(locationId);
      checkValue.asMap().forEach((key, value) async {
        if (value == true) {
          var i = PickTaskModel(
            track: key+1,
            failCode: 0,
            failReason: '',
            condition: 0,
            locationId: locationId,
            pickDetails: [],
            pickOrder: 0,
            state: 0,
            totalVolume: 0,
          );
          await fbProvider.addTaskData(i.toAdd());
          initialName = '';
          initCheckValue();
          trackValue = 0;
          notifyListeners();
        }else{
          print("no");
        }
      });
    }
  }

  Future<void> addLocData(FbProvider fbProvider) async {
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
    await fbProvider.addLocData(i.toMap());
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
      WasteLocationModel locData, FbProvider fbProvder) async {
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
  }

  Future<void> deleteData(FbProvider fbProvider, String locDocId) async {
    await fbProvider.deleteData(locDocId);

    notifyListeners();
  }

  void sortData() {
    taskList.sort((a, b) => a.track!.compareTo(b.track!));
    locList.sort((a, b) => a.locationId!.compareTo(b.locationId!));
    taskListTrack1 = taskList.where((element) => element.track == 1).toList();
    taskListTrack2 = taskList.where((element) => element.track == 2).toList();
    taskListTrack3 = taskList.where((element) => element.track == 3).toList();
    taskListTrack1.sort(
      (a, b) => a.pickOrder!.compareTo(b.pickOrder!),
    );
    taskListTrack2.sort(
      (a, b) => a.pickOrder!.compareTo(b.pickOrder!),
    );
    taskListTrack3.sort(
      (a, b) => a.pickOrder!.compareTo(b.pickOrder!),
    );
    getNameList();
  }

  void selectedTrack(int? i) {
    trackValue = i!;
    notifyListeners();
  }

  void selectedName(String? i) {
    initialName = i!;
    print(initialName);
    notifyListeners();
  }

  getNameList() {
    if (nameList.isEmpty) {
      for (var value in locList) {
        nameList.add(value.locationName!);
      }
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
  List<String> weekDay = ["월", "화", "수", "목", "금"];

  void valueCheck(int index) {
    if (checkValue[index] == false) {
      checkValue[index] = true;
    } else {
      checkValue[index] = false;
    }

    notifyListeners();
  }

  void initCheckValue() {
    checkValue.forEach((element) {
      element = false;

    });
    notifyListeners();
    print(checkValue.toString());
  }
}
