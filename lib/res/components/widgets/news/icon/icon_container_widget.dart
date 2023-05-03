import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../colors/colors.dart';

class IconsContainerWidget extends StatelessWidget {
  final Image image;
  final String text;
  final VoidCallback onTap;
  const IconsContainerWidget(
      {Key? key, required this.image, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
              height: Get.height * 0.075,
              width: Get.width * 0.14,
              decoration: BoxDecoration(
                color: AppColor.offWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: image),
        ),
        Positioned(
          top: 48,
          child: Container(
            height: Get.height * 0.016,
            width: Get.width * 0.14,
            decoration: const BoxDecoration(
              color: AppColor.redColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 6.5,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
