class WeekdayTaskModel {
  String? locationId;
  String? locationName;
  List<bool>? trackList;

  WeekdayTaskModel({
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
}
