import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../../provider/task_manage_provider.dart';
import '../../../../utilitys/colors.dart';
import '../../../../utilitys/constants.dart';
import 'add_item_widget.dart';
import 'check_dialog_widget.dart';

class TaskAddCafelistWidget extends StatelessWidget {
  const TaskAddCafelistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskManageProvider>(context);
    var size = MediaQuery
        .of(context)
        .size;
    var tItems = taskProvider.addTList;
    var fItems = taskProvider.addFList;
    return Container(
      width: (size.width - 70) / 2,
      decoration: BoxDecoration(
        border: Border.all(
          color: KColors.lightPrimary,
          width: 1,
        ),
        color: KColors.whiteGrey,
      ),
      child: Column(
        children: [
          Container(
            width: (size.width - 70) / 2,
            height: 70,
            color: KColors.lightPrimary,
            child: Center(
              child: Text(
                '추가하실 카페를 클릭해주세요.',
                style: kLabelTextStyle.copyWith(
                  color: KColors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(NORMALGAP),
              child: Column(
                children: [
                  Container(
                    color: KColors.white,
                    child: TextField(
                      maxLines: 1,
                      onChanged: (value) {
                        taskProvider.searchCafe(value);
                      },
                    ),
                  ),
                  kNorH,
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: fItems.length,
                      padding: EdgeInsets.only(bottom: SMALLGAP),
                      itemBuilder: (context, index) {
                        var item = fItems[index];
                        return AddItemWidget(
                          item: item,
                          onTap: () async {

                                switch (taskProvider.addValidation(item['waste'].locationId)) {
                                  case 0:
                                    showDialog(context: context, builder: (context) => CheckDialogWidget(title: '추가 불가',contents: '수거요일과 팀을 선택해주세요.',),);
                                    break;
                                  case 1:
                                    showDialog(context: context, builder: (context) => CheckDialogWidget(title: '추가 불가',contents: '이미 등록되어 있어요.',),);
                                    break;
                                  case 2:
                                    taskProvider.changeState(item);
                                    break;
                                }
                                // if (taskProvider.addValidation()) {
                                //   taskProvider.changeState(item);
                                // } else {
                                //   showDialog(context: context, builder: (context) => CheckDialogWidget(),);
                                //
                                //   // await FlutterPlatformAlert.showAlert(windowTitle: '태스크 추가 안됨', text: '수거요일과 팀을 선택해주세요.');
                                // }

                                // taskProvider.addToReserve(item);
                            },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
