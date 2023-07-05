import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:copick_manage_withweb/location_manage/widgets/required_info_widget.dart';
import 'package:copick_manage_withweb/provider/fb_helper.dart';
import 'package:copick_manage_withweb/provider/manage_provider.dart';
import 'package:copick_manage_withweb/provider/task_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../main.dart';

class AddLocation extends StatelessWidget {
  const AddLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var taskProvider = Provider.of<TaskProvider>(context);
    var fbProvider = Provider.of<FbHelper>(context);
    var locMProvider = Provider.of<ManageProvider>(context);
    final _locAddformKey = GlobalKey<FormState>();
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(SMALLGAP),
      ),
      child: Padding(
        padding: const EdgeInsets.all(NORMALGAP),
        child: Form(
          key: _locAddformKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '장소 추가하기',
                    style: makeTextStyle(20, AppColors.black, 'bold'),
                  ),
                  InkWell(
                    onTap: () {
                      locMProvider.changeAddLocationWidget();
                    },
                    child: Row(
                      children: [
                        (locMProvider.locationAddWidgetVisible)
                            ? Text('접기')
                            : Text('펼치기'),
                        (locMProvider.locationAddWidgetVisible)
                            ? Icon(Icons.arrow_drop_up_outlined)
                            : Icon(Icons.arrow_drop_down_outlined),
                      ],
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: locMProvider.locationAddWidgetVisible,
                child: Column(
                  children: [
                    Divider(),
                    RequiredInfoWidget(),
                    NorH,
                    Divider(),

                    // InputDemoInfo(),
                    // Divider(),
                    // NorH,
                    Row(
                      children: [
                        Container(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_locAddformKey.currentState!.validate()) {

                                taskProvider.addLocData(fbProvider).then((value) {
                                  taskProvider.clearController();
                                  AlertDialog(
                                    content: Text('등록되었습니다.'),
                                  );

                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.lightPrimary),
                            child: Text(
                              '수거 장소 추가하기',
                              style:
                                  makeTextStyle(16, AppColors.white, 'regular'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
