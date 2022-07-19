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

      'location_id': this.locationId,
      'location_name': this.locationName,
      'track_list': this.trackList,
    };
  }

  WeekdayTaskModel.fromJson(Map<String, dynamic> json, String docId)
      : locationId = json['location_id'],
        locationName = json['location_name'],
  trackList = json['track_list'],
        weekDocId = docId;
}
