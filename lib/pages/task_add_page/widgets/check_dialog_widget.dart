import 'package:copick_manage_withweb/utilitys/constants.dart';
import 'package:flutter/material.dart';

class CheckDialogWidget extends StatelessWidget {
  const CheckDialogWidget({required this.title, required this.contents, super.key});

  final String title;
  final String contents;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(title),
      contentPadding: EdgeInsets.all(NORMALGAP),
      children: [Text(contents)],
    );
  }
}
