import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/firebase_provider.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fbProvider = Provider.of<FbProvider>(context);
    return Container(
      child: Column(
        children: [
          Text('날짜 선택'),
          Expanded(child: ListView.builder(
            itemBuilder: (context, index) {
              return Text('index');
            },
          )),
        ],
      ),
    );
  }
}
