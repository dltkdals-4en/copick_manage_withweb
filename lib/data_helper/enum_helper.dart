enum AreaInfo {
  Anseong(
      title: '안성',
      id: 'adminAs',
      pw: 'admin1234',
      api: 'anseong',
      task: 'pick_task_anseong',
      record: 'pick_record_anseong',
      waste: 'waste_location_anseong'),
  Seongdong(
      title: '성동',
      id: 'adminSd',
      pw: 'admin1234',
      api: 'seongdong',
      task: 'pick_task',
      record: 'pick_task_demo',
      waste: 'waste_location'),
  Test(
      title: '테스트',
      id: 'test',
      pw: 'test1234',
      api: 'anseong',
      task: 'anseong_task_dummy',
      record: 'task_record_dummy',
      waste: 'waste_location_anseong');

  const AreaInfo({
    this.title,
    this.id,
    this.pw,
    required this.api,
    required this.record,
    required this.task,
    required this.waste,
  });

  final String? title;
  final String? id;
  final String? pw;
  final String api;
  final String record;
  final String task;
  final String waste;
}
