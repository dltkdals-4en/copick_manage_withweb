import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';

class SeongsuTaskModel{
    String? docId;
    String? locationName;
    String? pickUpDate;
    int? track;
    int? condition;
    String? locationId;

    SeongsuTaskModel({
      this.condition,
      this.docId,
      this.locationName,
      this.pickUpDate,
      this.track,
      this.locationId,
    });

    SeongsuTaskModel.fromJson(Map<String, dynamic> json, id){
      docId = id;
      locationId = json['location_id'];
      locationName = json['location_name'];
      condition = json['condition'];
      pickUpDate = (json['pick_up_date'] != null)?dateFormat(json['pick_up_date']):'';
      track = json['track'];
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