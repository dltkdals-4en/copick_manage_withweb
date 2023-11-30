import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:copick_manage_withweb/provider/record_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/fb_helper.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fbProvider = Provider.of<FbHelper>(context);
    var recardProvider =Provider.of<RecordProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text
            (recardProvider.dateSetting()),
          NorH,
          Expanded(child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const Text('index');
            },
          )),
        ],
      ),
    );
  }
}
