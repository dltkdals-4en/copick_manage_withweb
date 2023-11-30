import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/fb_helper.dart';
import '../../provider/task_provider.dart';
import 'modify_weekday_dialog.dart';


class TotaltrackListWidget extends StatelessWidget {
  const TotaltrackListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fbProvider = Provider.of<FbHelper>(context);
    var taskProvider = Provider.of<TaskProvider>(context);
    var size = MediaQuery.of(context).size;
    final addTaskFormKey = GlobalKey<FormState>();

    var totalList = taskProvider.totalList;
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: totalList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  taskProvider.getLocName(totalList[index].locationId!),
                ),
                subtitle: Text(
                    '${taskProvider.changeTrackValue(totalList[index].trackList!)}'),
                leading: Text('${totalList[index].locationId}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      child: const Text('수거 요일 변경'),
                      onPressed: () {
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) {
                        //   return ModifyDialog(index);
                        // }));
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ModifyWeekdayDialog(index);
                          },
                          barrierDismissible: false,
                        );
                      },
                    ),
                    SmW,
                    ElevatedButton(
                      onPressed: () {
                        taskProvider.deleteWeekdayData(index, fbProvider);
                        // taskProvider
                        //     .deleteData(fbProvider,
                        //     totalList[index].docId!)
                        //     .then((value) =>
                        //     Navigator.pushAndRemoveUntil(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) =>
                        //               MyApp(),
                        //         ),
                        //             (route) => false));
                      },
                      child: const Text('삭제'),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ),
        ),
      ],
    );
  }
}
