import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../model/pick_task_model.dart';
import '../model/waste_location_model.dart';
import 'firebase_provider.dart';

class AddTaskProvider with ChangeNotifier {

  TextEditingController dateTextController = TextEditingController();
  TextEditingController orderTextController = TextEditingController();
  DateTime dateTime = DateTime.now().add(Duration(days: 1));
  List<WasteLocationModel> locList = [];
  List<PickTaskModel> taskList = [];
  int trackValue = 0;
  List<int> trackItems = [0, 1, 2, 3];
  FormFieldValidator? validator;
  String initialName = '';
  List<String> nameList = ['매장 선택'];
  List<PickTaskModel> taskListTrack1 = [];
  List<PickTaskModel> taskListTrack2 = [];
  List<PickTaskModel> taskListTrack3 = [];

  TextEditingController codeTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController latTextController = TextEditingController();
  TextEditingController longTextController = TextEditingController();



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
    String code = codeTextController.text;
    if (trackValue == 0) {
      print('경로 선택 x');
    } else if (initialName == '' || initialName == '매장선택') {
      print('매장 선택 x');
    } else {
      var locationId = locList.firstWhere((element) => element.locationName == initialName).locationId;
      print(locationId);
      var i = PickTaskModel(
        track: trackValue,
        failCode: 0,
        failReason: '',
        condition: 0,
        locationId: locationId,
        pickDetails: [],
        pickOrder: int.parse(orderTextController.value.text),
        state: 0,
        totalVolume: 0,
      );
      await fbProvider.addTaskData(i.toAdd());
      initialName = '';
      orderTextController.clear();
      trackValue = 0;
      notifyListeners();
    }
  }

  String getLocName(String id) {
    return (locList.where((element) => element.locationId == id).isNotEmpty)
        ? locList
            .firstWhere((element) => element.locationId == id)
            .locationName!
        : '';
  }

  void sortData() {
    taskList.sort((a, b) => a.track!.compareTo(b.track!));
    locList.sort((a, b) => a.locationId!.compareTo(b.locationId!));
    taskListTrack1 = taskList.where((element) => element.track ==1).toList();
    taskListTrack2 = taskList.where((element) => element.track ==2).toList();
    taskListTrack3 = taskList.where((element) => element.track ==3).toList();
    taskListTrack1.sort((a, b) => a.pickOrder!.compareTo(b.pickOrder!),);
    taskListTrack2.sort((a, b) => a.pickOrder!.compareTo(b.pickOrder!),);
    taskListTrack3.sort((a, b) => a.pickOrder!.compareTo(b.pickOrder!),);
    getNameList();
  }

  void selectedTrack(int? i) {
    trackValue = i!;
    notifyListeners();
  }

  void selectedName(String? i) {
    initialName = i!;

    notifyListeners();
  }

  getNameList() {
    if (nameList.length == 1) {
      for (var value in locList) {
        nameList.add(value.locationName!);
      }
    }

    if (initialName == '') initialName = nameList[0];
  }
}
