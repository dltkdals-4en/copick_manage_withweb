import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:copick_manage_withweb/location_manage/add_location.dart';
import 'package:copick_manage_withweb/location_manage/widgets/modify_location_dialog.dart';
import 'package:copick_manage_withweb/main.dart';
import 'package:copick_manage_withweb/model/waste_location_model.dart';
import 'package:copick_manage_withweb/provider/task_provider.dart';
import 'package:copick_manage_withweb/provider/firebase_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'location_list.dart';

class WasteLocationPage extends StatefulWidget {
  const WasteLocationPage({Key? key}) : super(key: key);

  @override
  State<WasteLocationPage> createState() => _WasteLocationPageState();
}

class _WasteLocationPageState extends State<WasteLocationPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    var taskProvider = Provider.of<TaskProvider>(context);
    var size = MediaQuery.of(context).size;


    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NORMALGAP),
          child: Column(
            children: [
              AddLocation(),
              BigH,
              Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(SMALLGAP),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(NORMALGAP),
                  child: LocationList(),
                ),
              ),
              SizedBox(
                height: NORMALGAP,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

