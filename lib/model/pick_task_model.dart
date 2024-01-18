class PickTaskModel {
  String? pickDocId;
  int? pickOrder;
  String? locationName;
  String? locationId;
  int? track;
  String? team;

  PickTaskModel({
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

  PickTaskModel.fromJson(Map<String, dynamic> json, docId) {
    pickDocId = docId;
    pickOrder = json['pick_order'];
    locationName = json['location_name'];
    locationId = (json['location_id'].runtimeType == int)
        ? json['location_id'].toString()
        : json['location_id'];
    track = json['track'];
    team = (json['team'].runtimeType == int)
        ? json['team'].toString()
        : json['team'];
  }
}

