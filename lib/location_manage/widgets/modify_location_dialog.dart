import 'package:copick_manage_withweb/constants/constants.dart';

import 'package:copick_manage_withweb/provider/fb_helper.dart';
import 'package:copick_manage_withweb/provider/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';


class ModifyLocationDialog extends StatelessWidget {
  const ModifyLocationDialog(this.index, {Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final locModifyformKey = GlobalKey<FormState>();
    var size = MediaQuery.of(context).size;
    var provider = Provider.of<TaskProvider>(context);
    var locData = provider.locList[index];
    var fbProvder = Provider.of<FbHelper>(context);
    return AlertDialog(
      title: Text(
        '카페 정보 수정',
        style: makeTextStyle(20, AppColors.black, 'bold'),
      ),
      content: SizedBox(
        width: size.width / 2,
        height: size.height / 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '변경되는 부분만 수정해주세요. \n수정이 안된 부분은 기존 값으로 적용됩니다.',
              style: makeTextStyle(18, AppColors.black, 'bold'),
            ),
            NorH,
            Form(
              key: locModifyformKey,
              child: Table(
                columnWidths: const {
                  0: IntrinsicColumnWidth(),
                  1: FixedColumnWidth(10),
                  2: FlexColumnWidth(),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      const Text('매장명 : '),
                      SmW,
                      TextFormField(
                        controller: provider.modifyNameController,
                        decoration: InputDecoration(
                            hintText: locData.locationName ?? ''),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text('코드명 : '),
                      SmW,
                      TextFormField(
                        controller: provider.modifyCodeController,
                        decoration:
                            InputDecoration(hintText: locData.locationId ?? ''),
                        validator: (text) {
                          if (text!.isEmpty) {
                            text = locData.locationId;
                            provider.modify(text);
                            if (text!.length > 6) {
                              return '길이가 맞지않습니다.';
                            } else if (!RegExp(r'^(?:[A-Z]{1})(?:[0-9]{4})$')
                                .hasMatch(text)) {
                              return '형식에 맞지않습니다.';
                            } else if (provider.mCodeVali > 1) {
                              return '이미 등록된 코드입니다.';
                            }
                          } else {
                            if (text.length > 6) {
                              return '길이가 맞지않습니다.';
                            } else if (!RegExp(r'^(?:[A-Z]{1})(?:[0-9]{4})$')
                                .hasMatch(text)) {
                              return '형식에 맞지않습니다.';
                            } else if (provider.locList
                                .where((element) => element.locationId == text)
                                .isNotEmpty) {
                              return '이미 등록된 코드입니다.';
                            }
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text('주소 : '),
                      SmW,
                      TextFormField(
                        controller: provider.modifyAddressController,
                        decoration: InputDecoration(
                            hintText: locData.locationAddress ?? ''),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text('담당자명 : '),
                      SmW,
                      TextFormField(
                        controller: provider.modifyAdminController,
                        decoration: InputDecoration(
                            hintText: locData.locationAdmin ?? ''),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text('전화번호 : '),
                      SmW,
                      TextFormField(
                        controller: provider.modifyTelController,
                        decoration: InputDecoration(
                            hintText: locData.locationTel ?? ''),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text('위도, 경도 : '),
                      SmW,
                      TextFormField(
                        controller: provider.modifyLatLngController,
                        decoration: InputDecoration(
                            hintText:
                                (('${locData.locationGpsLat},${locData.locationGpsLong}')
                                        .isEmpty)
                                    ? ''
                                    : '${locData.locationGpsLat},${locData.locationGpsLong}'),
                        validator: (text) {
                          if (text!.isEmpty) {
                            text =
                                "${locData.locationGpsLat},${locData.locationGpsLong}";
                          }
                          if (!RegExp(
                                  r'^[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?),\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)$')
                              .hasMatch(text)) {
                            return '형식이 맞지 않습니다.';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            provider.clearModifyController();
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.white,
            side: const BorderSide(
              color: AppColors.lightPrimary,
              width: 1,
            ),
          ),
          child: const Text('취소'),
        ),
        ElevatedButton(
          onPressed: () {
            if (locModifyformKey.currentState!.validate()) {
              provider.modifyInfo(locData, fbProvder).then((value) {
                provider.clearModifyController();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyApp(),
                    ),
                        (route) => false);
              });
            } else {
              print("no");
            }
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lightPrimary),
          child: const Text('수정'),
        ),
      ],
    );
  }
}
