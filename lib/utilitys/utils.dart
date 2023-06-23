import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'colors.dart';
import 'constants.dart';

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int,Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
makeTextStyle(double fontSize, Color? fontColor,
    [String? fontWeight, double? height]) {
  var weight = FontWeight.w500;
  switch (fontWeight) {
    case 'bold':
      weight = FontWeight.bold;
      break;
    case 'regular':
      weight = FontWeight.normal;
      break;
    default:
      weight = FontWeight.normal;
      break;
  }

  return TextStyle(
    fontSize: fontSize,
    fontWeight: weight,
    color: fontColor ??KColors.black,
    fontFamily: 'NotoSansKR',
    height: height,
  );
}
makeFToast(BuildContext context,  String s) {
  FToast fToast = FToast();
  fToast.init(context);
  var size =MediaQuery.of(context).size;
  Widget toast = Container(
    width: size.width - NORMALGAP * 4,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: KColors.grey,
    ),
    height: BUTTONHEIGHT,
    child: Center(
      child: Text(
        s,
        style: kContentTextStyle.copyWith(fontSize: 20,color: KColors.white),
      ),
    ),
  );
  fToast.showToast(
    child: toast,
    positionedToastBuilder: (context, child) {
      return Positioned(
        bottom: 120,
        left: 40,
        child: child,
      );
    },
  );
}

makeBtnStyle(
    Color btnColor,
    Color borderColor,
    ) {
  return ElevatedButton.styleFrom(
    padding: EdgeInsets.zero,
    backgroundColor: btnColor,
    side: BorderSide(width: 1, color: borderColor),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 0,
    minimumSize: const Size(85, 36),
  );
}

ButtonStyle kCardButtonStyle = ElevatedButton.styleFrom(
  padding: EdgeInsets.zero, backgroundColor: KColors.blueGrey,
  side: const BorderSide(width: 1, color: KColors.lightGrey),
  elevation: 0,
  minimumSize: const Size(85, 36),
);

void makeTextUtil(String first, String second, String third){

}