import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';

class LocationDemo {
  String? locationId;
  String? locationName;
  String? locationPostal;
  String? locationAddress;
  double? locationGpsLat;
  double? locationGpsLong;

  String? locationTel;
  String? pickUpDate;
  int? pickOrder;
  int? track;
  int? condition;

  LocationDemo(
      {this.locationId,
      this.locationName,
      this.locationPostal,
      this.locationAddress,
      this.locationGpsLat,
      this.locationGpsLong,
      this.locationTel,
      this.pickUpDate,
      this.pickOrder,
      this.track});

  Map<String, dynamic> toMap() {
    return {
      'id': locationId,
      'name': locationName,
      'postal': locationPostal,
      'address': locationAddress,
      'lat': locationGpsLat,
      'long': locationGpsLong,
      'tel': locationTel,
      'pick_up_date': Timestamp.fromDate(DateTime.now()),
      'pick_order': pickOrder,
      'track': track,
      'condition': 0,
    };
  }

  LocationDemo.fromJson(Map<String, dynamic> json, String docId)
      : locationId = idFormat(json['location_id']),
        locationName = json['location_name'],
        locationPostal = json['location_postal'],
        locationAddress = json['location_address'],
        locationGpsLat = json['location_gps_lat'],
        locationGpsLong = json['location_gps_long'],
        locationTel = json['location_tel'],
        pickUpDate = dateFormat(json['last_call_date']);
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
