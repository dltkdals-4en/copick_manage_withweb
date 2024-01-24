import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;

import '../model/task_record_model.dart';

class HttpHelper {
  Future<dynamic> checkCafeVersion(String version) async {
    // var version = '1.0.1';
    dynamic j;
    var url = Uri.parse(
        'https://foureniotdata.cafe24.com/anseong/api/chkCafeInfoVer.php');
    var response = await http
        .post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'version': version}),
    )
        .then((value) {
      var status = value.statusCode;
      print(value.body);
      if (status >= 500) {
        //서버 에러
        print('서버 에러 :$status');
      } else if (status >= 400) {
        //클라이언트 에러
        print('클라이언트 에러:$status');
      } else if (status >= 300) {
        //리다이렉션
        print('리다이렉션:$status');
      } else if (status >= 200) {
        var i = json.decode(value.body);
        j = i['result'];
      } else {
        print('알수없는 에러:$status');
      }

      // var i = json.decode(value.body);
      // j = i['result'];
      // return j;
    });
    return j;

    // print(json.decode(response.body));
    // var i = json.decode(response.body);
    // j = i['result'];
    // return j;
  }

  Future<List<dynamic>> getCafeInfo(String loc) async {
    List<dynamic> j = [];
    var url = Uri.parse(
        'https://foureniotdata.cafe24.com/$loc/api/viewCafeInfoMini.php');
    await http.get(url).then((value) {
      var status = value.statusCode;

      if (status >= 500) {
        //서버 에러
        print('서버 에러 :$status');
      } else if (status >= 400) {
        //클라이언트 에러
        print('클라이언트 에러:$status');
      } else if (status >= 300) {
        //리다이렉션
        print('리다이렉션:$status');
      } else if (status >= 200) {
        var i = json.decode(value.body);
        j = i['result'];
      } else {
        print('알수없는 에러:$status');
      }
    });
    return j;
  }

  Future<void> getRecordInfo() async {
    var url = Uri.parse(
        'https://foureniotdata.cafe24.com/anseong/api/viewCafeInfoWaste.php');
    await http.get(url).then((value) {
      var i = json.decode(value.body);
      var j = i['result'];
      print(i);
      print(j[125]);
      print(j.length);
    });
  }

  // Future<void> updateCafeState(CardDataModel card, String state) async {
  //   String locationId = card.locationId!;
  //   int team = card.team!;
  //   var cafeCode = int.parse(locationId.substring(1, locationId.length));
  //   var status = 22;
  //   if (state == '1') {
  //     if (team < 40) {
  //       status = 21;
  //     } else {
  //       status = 23;
  //     }
  //   } else if (state == '3') {
  //     if (team < 40) {
  //       status = 22;
  //     } else {
  //       status = 24;
  //     }
  //   }
  //   String now = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  //   print(
  //       'sn: $cafeCode, ${cafeCode.runtimeType}// status : $status, ${status.runtimeType}');
  //   var url = Uri.parse(
  //       'https://foureniotdata.cafe24.com/anseong/api/updateSensorStatus.php');
  //   await http
  //       .post(
  //         url,
  //         headers: <String, String>{
  //           'Content-Type': 'application/json',
  //         },
  //         body: jsonEncode(
  //           {
  //             'cafeCode': cafeCode,
  //             'status': status,
  //           },
  //         ),
  //       )
  //       .then((value) => print(json.decode(value.body)));
  // }
  //
  // Future<void> addWasteInfo(TaskRecordModel card, String volumes) async {
  //   var sn = card.locationId!.substring(1, card.locationId!.length);
  //   int cafeCode = int.parse(sn);
  //   int pickGroup = card.team!;
  //   double pickWaste = double.parse(volumes);
  //   int? pickType;
  //   (card.team! < 40) ? pickType = 0 : pickType = 1;
  //   String now = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  //
  //   var response = await http.post(
  //     Uri.parse(
  //         'https://foureniotdata.cafe24.com/anseong/api/addWasteInfo.php'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode({
  //       'cafeCode': cafeCode,
  //       'pickGroup': pickGroup,
  //       'pickWaste': pickWaste,
  //       'pickType': pickType,
  //       'dateRegister': now,
  //     }),
  //   );
  //   print(response.body);
  // }
  //
  Future<dynamic> getWasteInfo(int cafeCode, String date) async {
    await http
        .post(
            Uri.parse(
                'https://foureniotdata.cafe24.com/anseong/api/viewWasteInfo.php'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode({'cafeCode': cafeCode, 'pickDate': date}))
        .then((value) {
      var i = jsonDecode(value.body);
      return i;
    });
  }
  //
  // Future<void> postApi(String url, Map<String, dynamic> data) async {
  //   var response = await http.post(
  //     Uri.parse(url),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //     },
  //     body: data,
  //   );
  //   return json.decode(response.body);
  // }
}
