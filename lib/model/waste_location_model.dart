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
  String? locationAdmin;

  WasteLocationModel(
      {this.locationId,
      this.locationName,
      this.locationPostal,
      this.locationAddress,
      this.locationGpsLat,
      this.locationGpsLong,
      this.locationTel,
      this.lastCallDate,
      this.locDocId,
      this.locationAdmin});

  Map<String, dynamic> toMap() {
    return {
      'location_id': locationId,
      'location_name': locationName,
      'location_postal': locationPostal,
      'location_address': locationAddress,
      'location_gps_lat': locationGpsLat,
      'location_gps_long': locationGpsLong,
      'location_tel': locationTel,
      'last_call_date': Timestamp.fromDate(DateTime.now()),
      'location_admin': locationAdmin,
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
        locationAdmin = json['location_admin'],
        locDocId = docId;
}

String idFormat(data) {
  if (data.runtimeType == String) {
    return data;
  } else {
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
