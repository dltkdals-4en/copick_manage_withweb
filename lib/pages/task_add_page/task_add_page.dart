import 'package:copick_manage_withweb/constants/screen_size.dart';
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
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3,
              crossAxisSpacing: NORMALGAP,
              mainAxisSpacing: NORMALGAP),
          itemCount: 50,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(NORMALGAP),
                  child: Text('$index'),
                ),
              ),
              onTap: () {
                print(index);
              },
            );
          },
        ),
      ),
    );
  }
}
