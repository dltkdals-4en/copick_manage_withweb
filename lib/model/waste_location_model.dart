

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';

class WasteLocationModel {
  String? locationId;
  String? locationName;
  String? locationPostal;
  String? locationAddress;
  double? locationGpsLat;
  double? locationGpsLong;
  String? locDocId;
  String? locationTel;
  String? lastCallDate;

  WasteLocationModel(
      {this.locationId,
      this.locationName,
      this.locationPostal,
      this.locationAddress,
      this.locationGpsLat,
      this.locationGpsLong,
      this.locationTel,
      this.lastCallDate,
      this.locDocId});

  Map<String, dynamic> toMap() {
    return {
      'location_id': this.locationId,
      'location_name': this.locationName,
      'location_postal': this.locationPostal,
      'location_address': this.locationAddress,
      'location_gps_lat': this.locationGpsLat,
      'location_gps_long': this.locationGpsLong,
      'location_tel': this.locationTel,
      'last_call_date': this.lastCallDate,
    };
  }

  WasteLocationModel.fromJson(Map<String, dynamic> json, String docId)
      : locationId = idFormat(json['location_id']),
        locationName = json['location_name'],
        locationPostal = json['location_postal'],
        locationAddress = json['location_address'],
        locationGpsLat = json['location_gps_lat'],
        locationGpsLong = json['location_gps_long'],
        locationTel = json['location_tel'],
        lastCallDate = dateFormat(json['last_call_date']),
        locDocId = docId;


}

String idFormat(data) {
  if(data.runtimeType== String){
    return data;
  }else{
    return data.toString();
  }
}
String dateFormat(Timestamp timestamp) {
  var date =
  DateTime.fromMicrosecondsSinceEpoch(timestamp.microsecondsSinceEpoch)
      .toString();
  var stringToDate = DateFormat('yy-MM-dd HH:mm').parse(date);
  var format = DateFormat('yy/MM/dd HH:mm');
  return format.format(stringToDate);
}