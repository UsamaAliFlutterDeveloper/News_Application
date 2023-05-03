import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../colors/colors.dart';

class CustomContainer extends StatefulWidget {
  final String name;
  final Image image1;
  final double height, width;

  const CustomContainer({
    Key? key,
    required this.name,
    required this.image1,
    this.height = 40,
    this.width = 45,
  }) : super(key: key);

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColor.greyColor,
            ),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: widget.image1)),
        Positioned(
          top: Get.height * 0.14,
          left: Get.width * 0.040,
          child: Container(
            height: Get.height * 0.5,
            width: Get.width * 0.8,
            decoration: const BoxDecoration(
              color: AppColor.redColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.name,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: AppColor.whiteColor),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            height: 40,
            width: 45,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.redColor,
                width: 2,
              ),
              color: AppColor.whiteColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: fav == true
                  ? const Icon(
                      Icons.favorite_rounded,
                      color: AppColor.redColor,
                      size: 25,
                    )
                  : const Icon(
                      Icons.favorite_border_rounded,
                      color: AppColor.redColor,
                    ),
              onPressed: () {
                setState(() {
                  fav = !fav;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
