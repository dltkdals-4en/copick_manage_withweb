import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

class RecordProvider with ChangeNotifier {

  var today = '';

  String dateSetting(){
    return DateFormat('yyyy년 MM월 dd일').format(DateTime.now()).toString();


  }


}
