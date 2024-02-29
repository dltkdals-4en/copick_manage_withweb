import 'dart:convert';
import 'dart:html' as html;
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class LocationManageProvider with ChangeNotifier {
  final reader = html.FileReader();
  int? newCode;

  html.File? collectData;

  Image? collectImage;
  html.File? parkingData;

  Image? parkingImage;
  String? cafeName;
  String? gps;
  double? gpsLat;
  double? gpsLong;
  String? address;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<void> uploadCollectImage() async {
    var i;
    var j;

    i = await ImagePickerWeb.getImageInfo;
    collectImage = Image.memory(i.data);
    String mimeType = Path.basename(i.fileName);
    collectData = html.File(i.data, i.fileName, {'type': mimeType});
    notifyListeners();
  }

  Future<void> uploadParckingImage() async {
    var i;
    var j;

    i = await ImagePickerWeb.getImageInfo;

    String mimeType = Path.basename(i.fileName);
    parkingData = html.File(i.data, i.fileName, {'type': mimeType});
    parkingImage = Image.memory(i.data);
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
    newCode ??= maxNum;
    notifyListeners();
  }

  convertData(data){
    var converted ;

  }
  void addCafe() async {
    var gpsList = gps?.split(',') ?? ['0', '0'];
    gpsLat = double.parse(gpsList[0].trim());
    gpsLong = double.parse(gpsList[1].trim());
    File file = new File('');
    reader.readAsDataUrl(collectData!);
    reader.onLoad.first.then((value) {
      final encoded = reader.result as String;
      final imageBase64 = encoded.replaceFirst(
          RegExp(r'data:image/[^;]+;base64,'),
          ''); // this is to remove some non necessary stuff
      file=  File.fromRawPath(base64Decode(imageBase64));

    });
    if (collectData != null) {
      await _firebaseStorage.ref('collect_location/${newCode}').putFile(file);
    }
    print(
        '$newCode//$cafeName//$gpsLat//$gpsLong//${collectData}//${parkingData}');
  }
}
