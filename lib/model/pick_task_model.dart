import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class PickTaskModel {
  String? pickDocId;
  int? pickOrder;
  String? userName;
  String? locationName;
  int? state;
  String? taskAllocateTime;
  String? pickUpDate;
  String? locationId;
  List? pickDetails;
  double? totalVolume;
  int? failCode;
  String? failReason;
  int? condition;
  int? track;

  PickTaskModel({
    this.pickDocId,
    this.pickOrder,
    this.userName,
    this.locationName,
    this.state,
    this.taskAllocateTime,
    this.pickUpDate,
    this.locationId,
    this.totalVolume,
    this.pickDetails,
    this.failReason,
    this.failCode,
    this.condition,
    this.track,
  });

  Map<String, dynamic> toMap() {
    return {
      'pick_doc_id': this.pickDocId,
      'pick_order': this.pickOrder,
      'pick_state': this.state,
      'location_id': this.locationId,
      'pick_total_waste': this.totalVolume,
      'pick_details': this.pickDetails,
      'task_allocate_time': this.taskAllocateTime,
      'pick_up_date': this.pickUpDate,
      'pick_fail_code': this.failCode,
      'pick_fail_reason': this.failReason,
    };
  }

  Map<String, dynamic> toAdd() {
    return {
      'pick_order': this.pickOrder,
      'pick_state': this.state,
      'location_id': this.locationId,
      'pick_total_waste': this.totalVolume,
      'pick_details': this.pickDetails,
      'task_allocate_time': Timestamp.fromDate(DateTime.now()) ,
      'pick_fail_code': this.failCode,
      'pick_fail_reason': this.failReason,
      'condition': this.condition,
      'track': this.track,
    };
  }

  PickTaskModel.fromJson(Map<String, dynamic> json, id) {
    pickDocId = id;
    pickOrder = json['pick_order'];
    userName = json['allocated_user_id'];
    locationName = json['location_name'];
    state = json['pick_state'];
    taskAllocateTime = dateFormat(json['task_allocate_time']);

    locationId = (json['location_id'].runtimeType == int)
        ? json['location_id'].toString()
        : json['location_id'];
    pickDetails = json['pick_details'];
    totalVolume = (json['pick_total_waste'] != null)
        ? double.parse(json['pick_total_waste'].toString())
        : 0;
    failCode = json['pick_fail_code'];
    failReason = json['pick_fail_reason'];
    condition = json['condition'];
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
