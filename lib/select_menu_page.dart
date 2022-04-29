import 'package:copick_manage_withweb/add_task/add_task_page.dart';
import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:flutter/material.dart';

import 'add_location/add_location_page.dart';

class SelectMenuPage extends StatelessWidget {
  const SelectMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddTaskPage(),
                    ));
              },
              child: Text('태스크 추가하기'),
            ),
            SizedBox(
              height: NORMALGAP,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddLocationPage(),
                    ));
              },
              child: Text('카페 추가하기'),
            ),
          ],
        ),
      ),
    );
  }
}
