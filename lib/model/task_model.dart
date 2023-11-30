import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';

class TaskModel {
  String? pickDocId;
  int? pickOrder;
  String? locationName;
  String? locationId;
  int? track;
  String? team;

  TaskModel({
    this.pickDocId,
    this.pickOrder,
    this.locationName,
    this.locationId,
    this.track,
    this.team,
  });

  Map<String, dynamic> toMap() {
    return {
      'pick_doc_id': pickDocId,
      'pick_order': pickOrder,
      'location_id': locationId,
      'team': team,
    };
  }

  Map<String, dynamic> toAdd() {
    return {
      'pick_order': pickOrder,
      'location_id': locationId,
      'track': track,
      'team': double.parse(team!),
    };
  }

  TaskModel.fromJson(Map<String, dynamic> json, locName, docId) {
    pickDocId = docId;
    pickOrder = json['pick_order'];
    locationName = locName;

    locationId = formatId(json['location_id']);

    track = json['track'];
    team = json['team'].toString();
  }
}

String dateFormat(Timestamp timestamp) {
  var date =
      DateTime.fromMicrosecondsSinceEpoch(timestamp.microsecondsSinceEpoch)
          .toString();
  var stringToDate = DateFormat('yy-MM-dd HH:mm:ss').parse(date);
  var format = DateFormat('yy/MM/dd HH:mm:ss');
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
