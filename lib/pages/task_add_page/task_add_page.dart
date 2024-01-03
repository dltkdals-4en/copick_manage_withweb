import 'package:copick_manage_withweb/utilitys/constants.dart';
import 'package:flutter/material.dart';

class TaskAddPage extends StatelessWidget {
  const TaskAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('태스크 추가하기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(NORMALGAP),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('요일 선택'),
                    Text('월'),
                  ],
                ),
                kBigW,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('팀 선택'),
                    Text('A'),
                  ],
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3,
                    crossAxisSpacing: NORMALGAP,
                    mainAxisSpacing: NORMALGAP),
                itemCount: 50,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    value: false,
                    onChanged: (value) {},
                    title: Text('$index'),
                    controlAffinity: ListTileControlAffinity.leading,

                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
