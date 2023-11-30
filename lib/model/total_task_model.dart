class WeekdayTaskModel {
  String? weekDocId;
  String? locationId;
  String? locationName;
  List<dynamic>? trackList;


  WeekdayTaskModel({
    this.weekDocId,
    this.locationId,
    this.locationName,
    this.trackList,
  });

  Map<String, dynamic> toMap() {
    return {

      'location_id': locationId,
      'location_name': locationName,
      'track_list': trackList,
    };
  }

  WeekdayTaskModel.fromJson(Map<String, dynamic> json, String docId)
      : locationId = json['location_id'],
        locationName = json['location_name'],
  trackList = json['track_list'],
        weekDocId = docId;
}
