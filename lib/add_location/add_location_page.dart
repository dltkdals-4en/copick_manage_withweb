import 'package:copick_manage_withweb/add_location/widgets/required_info_widget.dart';
import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:copick_manage_withweb/provider/add_task_provider.dart';
import 'package:copick_manage_withweb/provider/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddLocationPage extends StatelessWidget {
  const AddLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var taskProvider = Provider.of<AddTaskProvider>(context);
    var size = MediaQuery.of(context).size;
    var locList = taskProvider.locList;

    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(NORMALGAP),
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height / 4,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(SMALLGAP),
              ),
              child: Padding(
                padding: const EdgeInsets.all(NORMALGAP),
                child: Column(
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
                      child: ListView.builder(
                        itemCount: locList.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('카페 코드'),
                                Text('카페명 '),
                              ],
                            );
                          } else {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${locList[index - 1].locationId}'),
                                Text(
                                  '${locList[index - 1].locationName}',
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: NORMALGAP,
            ),
            Container(
              width: size.width,
              height: size.height / 3,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(SMALLGAP),
              ),
              child: Padding(
                padding: const EdgeInsets.all(NORMALGAP),
                child: RequiredInfoWidget(formKey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




