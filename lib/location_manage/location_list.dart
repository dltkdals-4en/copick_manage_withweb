import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:copick_manage_withweb/location_manage/widgets/modify_location_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/screen_size.dart';
import '../main.dart';
import '../provider/fb_helper.dart';
import '../provider/task_provider.dart';

class LocationList extends StatelessWidget {
  const LocationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fbProvider = Provider.of<FbHelper>(context);
    var taskProvider = Provider.of<TaskProvider>(context);
    var size = MediaQuery.of(context).size;
    var locList = taskProvider.locList;
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '카페 목록',
              style: makeTextStyle(20, AppColors.black, 'bold'),
            ),
            Text('카페 개수 : ${locList.length}'),
          ],
        ),
        SizedBox(
          height: SMALLGAP,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: locList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  '${locList[index].locationName}',
                ),
                leading: Text('${locList[index].locationId}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      child: Text(
                        '수정',
                        style: TextStyle(
                          color: AppColors.lightPrimary,
                        ),
                      ),
                      onPressed: () {
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) {
                        //   return ModifyDialog(index);
                        // }));
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ModifyLocationDialog(index);
                          },
                          barrierDismissible: false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        side: BorderSide(
                          color: AppColors.lightPrimary,
                          width: 1,
                        ),
                      ),
                    ),
                    SmW,
                    ElevatedButton(
                      onPressed: () {
                        taskProvider
                            .deleteLocData(fbProvider,
                            locList[index].locDocId!)
                            .then((value) =>
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MyApp(),
                                ),
                                    (route) => false));
                      },
                      child: Text('삭제'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                          AppColors.lightPrimary),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
        ),
      ],
    );
  }
}
