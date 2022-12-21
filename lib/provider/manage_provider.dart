import 'package:flutter/material.dart';

class ManageProvider with ChangeNotifier{
    bool locationAddWidgetVisible = true;
    bool locationListWidgetVisible = true;
    bool taskAddWidgetVisible = true;
    bool taskListWidgetVisible = true;

  void changeAddLocationWidget() {
    (locationAddWidgetVisible)?locationAddWidgetVisible=false:locationAddWidgetVisible=true;
    notifyListeners();
  }
    void changeAddTaskWidget() {
      (taskAddWidgetVisible)?taskAddWidgetVisible=false:taskAddWidgetVisible=true;
      notifyListeners();
    }

}