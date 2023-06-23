import 'package:flutter/material.dart';

class ManageProvider with ChangeNotifier{
    bool locationAddWidgetVisible = true;
    bool locationListWidgetVisible = true;
    bool taskAddWidgetVisible = true;
    bool taskListWidgetVisible = true;

  String loc1 = '성수';

  void changeLoc1() {
    loc1 = '평택';
    notifyListeners();
  }

  void changeAddLocationWidget() {
    (locationAddWidgetVisible)?locationAddWidgetVisible=false:locationAddWidgetVisible=true;
    notifyListeners();
  }
    void changeAddTaskWidget() {
      (taskAddWidgetVisible)?taskAddWidgetVisible=false:taskAddWidgetVisible=true;
      notifyListeners();
    }

}