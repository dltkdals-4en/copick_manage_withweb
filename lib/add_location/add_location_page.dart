import 'package:copick_manage_withweb/add_location/widgets/input_demo_info.dart';
import 'package:copick_manage_withweb/add_location/widgets/modify_location_dialog.dart';
import 'package:copick_manage_withweb/add_location/widgets/option_info_widget.dart';
import 'package:copick_manage_withweb/add_location/widgets/required_info_widget.dart';
import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:copick_manage_withweb/provider/task_provider.dart';
import 'package:copick_manage_withweb/provider/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class AddLocationPage extends StatefulWidget {
  const AddLocationPage({Key? key}) : super(key: key);

  @override
  State<AddLocationPage> createState() => _AddLocationPageState();
}

class _AddLocationPageState extends State<AddLocationPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var fbProvider = Provider.of<FbProvider>(context);
    var taskProvider = Provider.of<TaskProvider>(context);
    var size = MediaQuery.of(context).size;
    var locList = taskProvider.locList;

    final _locAddformKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NORMALGAP),
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height / 3,
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
                            '?????? ??????',
                            style: makeTextStyle(20, AppColors.black, 'bold'),
                          ),
                          Text('?????? ?????? : ${locList.length}'),
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
                                  TextButton(
                                    child: Text('??????'),
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
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      taskProvider
                                          .deleteData(fbProvider,
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
                                    child: Text('??????'),
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
                  ),
                ),
              ),
              SizedBox(
                height: NORMALGAP,
              ),
              Container(
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
                        Text(
                          '?????? ????????????',
                          style: makeTextStyle(20, AppColors.black, 'bold'),
                        ),
                        Divider(),
                        RequiredInfoWidget(),
                        NorH,
                        Divider(),
                        OptionInfoWidget(),
                        NorH,
                        Divider(),
                        // InputDemoInfo(),
                        // Divider(),
                        // NorH,
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                if (_locAddformKey.currentState!.validate()) {
                                  taskProvider
                                      .addLocData(fbProvider)
                                      .then((value) {
                                    taskProvider.clearController();
                                    AlertDialog(
                                      content: Text('?????????????????????.'),
                                    );
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyApp(),
                                        ),
                                        (route) => false);
                                  });
                                }
                              },
                              child: Text('????????? ????????????'),
                            ),
                            // BigW,
                            // ElevatedButton(
                            //   onPressed: () async {
                            //     if (formKey.currentState!.validate()) {
                            //       taskProvider.addDemoData(fbProvider);
                            //     }
                            //   },
                            //   child: Text('?????? ????????????'),
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
