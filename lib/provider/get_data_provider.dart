import 'package:copick_manage_withweb/provider/fb_helper.dart';
import 'package:flutter/material.dart';

import '../model/waste_location_model.dart';
import '../pages/area_config/area_config.dart';
import '../utilitys/utils.dart';

class GetDataProvider with ChangeNotifier {
  Area selectedArea = Area.undefined;
  bool haveLoc = false;
  bool haveTask = false;
  List<WasteLocationModel> locList = [];

  void changeArea(Area area) {
    selectedArea = area;
    notifyListeners();
  }

  Future<void> getLocData() async {
    if (selectedArea != Area.undefined) {
      print('$selectedArea data loading');
      if (!haveLoc) {
        locList.clear();
        await FbHelper().getLocData(selectedArea.locPath).then((value) {
          value.docs.forEach((element) {
            locList.add(WasteLocationModel.fromJson(element.data(), element.id));
          });
        }).then((value) {
          print('loclist -> ${locList.length}');
          haveLoc =true;
          notifyListeners();
        });
      }
    } else {
      print('Area empty');
    }
  }

  Future<void> getTaskData() async {
    if (selectedArea != Area.undefined) {
      print('$selectedArea data loading');
      if (!haveLoc) {
        // taskList.clear();
        await FbHelper().getLocData(selectedArea.locPath).then((value) {
          value.docs.forEach((element) {
            locList.add(WasteLocationModel.fromJson(element.data(), element.id));
          });
        }).then((value) {
          print('loclist -> ${locList.length}');
          haveLoc =true;
          notifyListeners();
        });
      }
    } else {
      print('Area empty');
    }
  }

  Future<void> insertLocData() async {

  }

  Future<void> updateLocData() async {

  }

  Future<void> deleteLocData() async {

  }

  Future<void> insertTaskData() async {

  }

  Future<void> updateTaskData() async {

  }

  Future<void> deleteTaskData() async {

  }

  void error() {

  }
  void init() {
    haveLoc = false;
    haveTask =false;
  }

}