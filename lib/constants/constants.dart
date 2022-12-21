import 'dart:ui';

import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class AppColors {
  static const Color primary = Color(0xFF006E51);
  static const Color lightPrimary = Color(0xFF00A862);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF292929);
  static const Color blackGrey = Color(0xFF969696);
  static const Color darkGrey = Color(0xFFA8A8A8);
  static const Color grey = Color(0xFFB7B7B7);
  static const Color lightGrey = Color(0xFFD8D8D8);
  static const Color whiteGrey = Color(0xFFE6E6E6);
  static const Color backgroundWhite = Color(0xFFF6F6F6);
  static const Color lightBlue = Color(0xFFE8F0FF);
  static const Color blueGrey = Color(0xFFCBCFD6);
  static const Color green = Color(0xFF50CF63);
  static const Color darkGreen = Color(0xFF2DAB40);
  static const Color yellow = Color(0xFFF3BD27);
  static const Color lightYellow = Color(0xFFFFD411);
  static const Color darkYellow = Color(0xFFE4AE19);
  static const Color orange = Color(0xFFF38C27);
  static const Color lightRed = Color(0xFFF95151);
  static const Color red = Color(0xFFE32A2A);
  static const Color greyBlue = Color(0xFF9BAEE4);
}

enum CardType {
  EMPTY,
  TASK,
  MAP,
  DONE,
}
enum UseCase {
  EMPTY,
  SUCCESS,
  FAIL,
  FAILEMPTY,
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
      break;
  }

  return TextStyle(
    fontSize: fontSize,
    fontWeight: weight,
    color: fontColor ?? AppColors.black,
    fontFamily: 'NotoSansKR',
    height: height,
  );
}

const BigH = SizedBox(
  height: 30,
);
const BigW = SizedBox(
  width: 30,
);
const NorH = SizedBox(
  height: 20,
);
const NorW = SizedBox(
  width: 20,
);
const SmH = SizedBox(
  height: 10,
);
const SmW = SizedBox(
  width: 10,
);

// makeFToast(BuildContext context, Size size, String s) {
//   FToast fToast = FToast();
//   fToast.init(context);
//   Widget toast = Container(
//     width: size.width - NORMALGAP * 2,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//       color: AppColors.darkGrey,
//     ),
//     height: BUTTONHEIGHT,
//     child: Center(
//       child: Text(
//         s,
//         style: makeTextStyle(16, AppColors.white, 'bold'),
//       ),
//     ),
//   );
//   fToast.showToast(
//     child: toast,
//     positionedToastBuilder: (context, child) {
//       return Positioned(
//         child: child,
//         bottom: 120,
//         left: 20,
//       );
//     },
//   );
// }

const mainPadding = EdgeInsets.fromLTRB(20, 20, 20, 20);
const eTextStyleBody14b_medium = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: AppColors.blackGrey,
  fontFamily: 'NotoSans',
);
const eTextStyleBody14bg = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: AppColors.blackGrey,
  fontFamily: 'NotoSans',
);
const eTextStyleBody14g = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: AppColors.grey,
  fontFamily: 'NotoSans',
);
const eTextStyleBody16_medium = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: AppColors.black,
  fontFamily: 'NotoSans',
);

const eTextStyleBody16_bold = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: AppColors.black,
  fontFamily: 'NotoSans',
);
const eTextStyleBody16y = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: AppColors.yellow,
  fontFamily: 'NotoSans',
);
const eTextStyleBody16o = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: AppColors.orange,
  fontFamily: 'NotoSans',
);
const eTextStyleBody16r = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: AppColors.lightRed,
  fontFamily: 'NotoSans',
);
const eTextStyleBody16green = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: AppColors.green,
  fontFamily: 'NotoSans',
);
const eTextStyleBody16grey = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: AppColors.grey,
  fontFamily: 'NotoSans',
);
const eTextStyleButton16 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: AppColors.black,
  fontFamily: 'NotoSans',
  height: 1,
);

const eTextStyleButton16w = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: Colors.white,
  fontFamily: 'NotoSans',
  height: 1,
);
const eTextStyleButton16p = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: AppColors.lightPrimary,
  fontFamily: 'NotoSans',
  height: 1,
);
const eTextStyleBody18b_medium = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: AppColors.black,
  fontFamily: 'NotoSans',
);
const eTextStyleBody18b_bold = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: AppColors.black,
  fontFamily: 'NotoSans',
);
const eTextStyleButton18w = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontFamily: 'NotoSans',
);
const eTextStyleTitle20 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: AppColors.black,
);
const eTextStyleHeadLine24 = TextStyle(
  fontSize: 24,
  fontFamily: 'NotoSans',
);
const eTextStyleSubtitle28 = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w400,
  color: AppColors.black,
);
const eTextStyleSubtitle28p = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: AppColors.primary,
);
const eTextStyleSubtitle24p = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: AppColors.primary,
);
const eTextStyleSubtitle24 = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: AppColors.black,
);

