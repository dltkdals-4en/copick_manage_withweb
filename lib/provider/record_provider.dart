import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RecordProvider with ChangeNotifier {
  var today = '';
  DateTime? selectedDate;

  String dateFormat(DateTime? time) {
    if (time == null) {
      return DateFormat('yyyy년 MM월 dd일').format(DateTime.now()).toString();
    } else {
      return DateFormat('yyyy년 MM월 dd일').format(time).toString();
    }
  }

  Future<void> changeDate(BuildContext context) async {
    selectedDate = await showDatePicker(
      initialDate: selectedDate ?? DateTime.now(),
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );
    notifyListeners();
  }
}
