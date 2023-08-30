
const String sdLoc = 'waste_location';
const String sdTask = 'pick_task_seongdong';
const String anLoc = 'waste_location_anseong';
const String anTask = 'pick_task_anseong';

enum Area { seongdong(sdLoc,sdTask), anseong(anLoc,anTask), undefined('','');

  const Area(this.locPath, this.taskPath);
  final String locPath;
  final String taskPath;


}
