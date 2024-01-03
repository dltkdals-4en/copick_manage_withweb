import 'package:copick_manage_withweb/location_manage/widgets/modify_location_dialog.dart';
import 'package:copick_manage_withweb/utilitys/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../main.dart';
import '../provider/fb_helper.dart';
import '../provider/task_provider.dart';
import '../utilitys/colors.dart';

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
              style: kHeaderTextStyle.copyWith()
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
                          color: KColors.lightPrimary,
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
                        backgroundColor: KColors.white,
                        side: BorderSide(
                          color: KColors.lightPrimary,
                          width: 1,
                        ),
                      ),
                    ),
                    kSmW,
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
                      child: Text('삭제', style: kBtnTextStyle.copyWith(fontSize: 14),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                         KColors.lightPrimary),
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
