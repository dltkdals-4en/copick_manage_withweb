import 'package:copick_manage_withweb/provider/record_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utilitys/constants.dart';


class RecordPage extends StatelessWidget {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    var record = Provider.of<RecordProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(NORMALGAP),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(record.dateFormat(record.selectedDate),),
                kNorW,
                ElevatedButton(
                  onPressed: () async {
                    await record.changeDate(context);
                  },
                  child: Text('날짜 변경'),
                ),
              ],
            ),
            kBigH,
            Expanded(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('$index'),
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
