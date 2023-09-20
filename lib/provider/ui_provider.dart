import 'package:copick_manage_withweb/data_helper/enum_helper.dart';
import 'package:flutter/cupertino.dart';

import '../model/task_model.dart';
import '../model/waste_location_model.dart';

class UiProvider with ChangeNotifier{
  AreaInfo? selectedArea;
  List<WasteLocationModel>? wasteList;
  List<TaskModel>? taskList;


}