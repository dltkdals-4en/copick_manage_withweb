import 'dart:html' as html;
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:copick_manage_withweb/data_helper/enum_helper.dart';
import 'package:copick_manage_withweb/data_helper/fb_helper.dart';
import 'package:copick_manage_withweb/model/waste_location_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class LocationManageProvider with ChangeNotifier {
  AreaInfo? selectedArea;
  final reader = html.FileReader();
  int? newCode;

  Uint8List? collectData;

  Image? collectImage;
  Uint8List? parkingData;

  Image? parkingImage;
  String? cafeName;
  String? gps;
  double? gpsLat;
  double? gpsLong;
  String? address;
  String? collectUrl;

  Future<void> uploadCollectImage() async {
    collectData = await ImagePickerWeb.getImageAsBytes();
    collectImage = Image.memory(collectData!);

    notifyListeners();
  }

  Future<void> uploadParckingImage() async {
    parkingData = await ImagePickerWeb.getImageAsBytes();
    parkingImage = Image.memory(parkingData!);

    notifyListeners();
  }

  void changeCafeName(String value) {
    cafeName = value;
    notifyListeners();
  }

  void changeGps(String value) {
    gps = value;

    notifyListeners();
  }

  getCafeCode(int maxNum) {
    newCode ??= maxNum + 1;
    notifyListeners();
  }

  convertData(data) {
    var converted;
  }

  void changeValue(valueCase input, String value) {
    switch (input) {
      case valueCase.cafeName:
        cafeName = value;
        notifyListeners();
      case valueCase.gpsLat:
        gpsLat = double.parse(value);
        notifyListeners();
      // TODO: Handle this case.
      case valueCase.gpsLong:
        gpsLong = double.parse(value);
        notifyListeners();
      // TODO: Handle this case.
    }
  }

  Future<void> addCafe() async {
    var gpsList = gps?.split(',') ?? ['0', '0'];
    gpsLat = double.parse(gpsList[0].trim());
    gpsLong = double.parse(gpsList[1].trim());
    var map = WasteLocationModel(
      locationId: newCode.toString(),
      locationName: cafeName,
      locationGpsLong: gpsLong,
      locationGpsLat: gpsLat,
      locationAddress: address,
    ).toMap();
    // print(map);
    print(selectedArea);
    print(newCode);
    await FbHelper().addLocData(map, selectedArea);
    await FbHelper().uploadCollectImage(newCode.toString(), collectData!);
    await FbHelper().uploadParkingImage(newCode.toString(), parkingData!);
    init();
    notifyListeners();
  }

  void init() {
    collectData = null;
    collectImage = null;
    parkingData = null;
    parkingImage = null;
    cafeName = null;
    gps = null;
    notifyListeners();
  }

  void updateCafe() async {}

  Future<void> getImage(String locationId) async {
    var i = await FbHelper().getImage(locationId);
    if (i !=null) {
      collectUrl = i;
    }

    notifyListeners();
  }
}
