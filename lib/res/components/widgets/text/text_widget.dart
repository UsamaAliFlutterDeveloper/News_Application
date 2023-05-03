import 'package:flutter/material.dart';

import '../../../colors/colors.dart';

Text customText(
  String text,
  bool mainColor,
) {
  return Text(
    text,
    style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: mainColor == true ? AppColor.blackColor : Colors.white),
  );
}
