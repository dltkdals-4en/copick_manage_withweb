import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TaskRecordModel {
  String? locationId;
  String? locationName;
  int? track;
  int? condition;
  DateTime? pickUpDate;

  TaskRecordModel({
    this.locationId,
    this.locationName,
    this.track,
    this.condition,
    this.pickUpDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'location_id': locationId,
      'location_name': locationName,
      'track': track,
      'condition': condition,
      'pick_up_date': pickUpDate,
    };
  }

  TaskRecordModel.fromJson(Map<String, dynamic> json, String docId)
      : locationId = json['location_id'],
        locationName = json['location_name'],
        track = json['track']??0,
        condition = json['condition'],
        pickUpDate = dateFormat(json['pick_up_date']);
}

DateTime dateFormat(Timestamp timestamp) {
  var date =
      DateTime.fromMicrosecondsSinceEpoch(timestamp.microsecondsSinceEpoch);

  var dateString =
      DateTime.fromMicrosecondsSinceEpoch(timestamp.microsecondsSinceEpoch)
          .toString();
  var stringToDate = DateFormat('yy-MM-dd HH:mm').parse(dateString);
  var format = DateFormat('yy/MM/dd HH:mm');
  return date;
}
