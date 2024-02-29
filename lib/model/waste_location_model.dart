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

  String? locationAdmin;

  WasteLocationModel(
      {this.locationId,
      this.locationName,
      this.locationPostal,
      this.locationAddress,
      this.locationGpsLat,
      this.locationGpsLong,
      this.locationTel,

      this.locDocId,
      this.locationAdmin});

  Map<String, dynamic> toMap() {
    return {
      'location_id': locationId,
      'cafe_name': locationName,
      'location_addr': locationAddress,
      'location_gps_lat': locationGpsLat,
      'location_gps_long': locationGpsLong,
      'manager_tel': locationTel,
    };
  }

  WasteLocationModel.fromJson(Map<String, dynamic> json, String docId)
      : locationId = idFormat(json['location_id']),
        locationName = json['cafe_name'],
        locationPostal = json['location_postal'],
        locationAddress = json['location_address'],
        locationGpsLat = json['location_gps_lat'],
        locationGpsLong = json['location_gps_long'],
        locationTel = json['location_tel'],

        locationAdmin = json['location_admin'],
        locDocId = docId;

  WasteLocationModel.fromHttpJson(Map<String, dynamic> json)
      : locationId = formatId(json["cafe_code"]),
        locationName = json['cafe_name'],
// locationPostal = json['location_post'],
        locationAddress = json['location_addr'],
        locationGpsLat = double.parse(json['location_gps_lat']),
        locationGpsLong = double.parse(json['location_gps_lng']),
        locationTel = json['manager_tel'];
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

String? formatId(json) {
  var i = json.toString();
  String? j;
  if (i.startsWith('S')) {
    j = i.substring(1);
  } else if (i.startsWith('A0')) {
    j = i.replaceFirst("A0", '1');
  } else {
    j = i;
  }

  return j;
}
