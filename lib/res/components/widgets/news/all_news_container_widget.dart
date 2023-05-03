import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicenews/res/colors/colors.dart';

class AllNewsContainer extends StatefulWidget {
  final String name;
  final Image image1;
  final String time;

  const AllNewsContainer({
    Key? key,
    required this.name,
    required this.image1,
    required this.time,
  }) : super(key: key);

  @override
  State<AllNewsContainer> createState() => _AllNewsContainerState();
}

class _AllNewsContainerState extends State<AllNewsContainer> {
  bool fav = false;

  void _addToFavorites() {
    setState(() {
      fav = !fav;
    });

    if (fav) {
      if (kDebugMode) {
        print('Added ${widget.name} to favorites!');
      }
    } else {
      if (kDebugMode) {
        print('Removed ${widget.name} from favorites!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Container(
                  color: AppColor.greyColor,
                  height: Get.height * 0.24,
                  width: Get.width,
                  child: widget.image1),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: Get.height * 0.05,
              width: Get.width * 0.5,
              decoration: const BoxDecoration(
                  color: AppColor.redColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Center(
                  child: Text(
                widget.time,
                style:
                    const TextStyle(fontSize: 12, color: AppColor.whiteColor),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180, left: 120),
            child: Container(
              height: Get.height * 0.06,
              width: Get.width * 2.8,
              decoration: const BoxDecoration(
                  color: AppColor.redColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.name,
                  style: const TextStyle(
                      fontSize: 12,
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.w500),
                ),
              )),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
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
                      )
                    : const Icon(
                        Icons.favorite_border_rounded,
                        color: AppColor.redColor,
                      ),
                onPressed: _addToFavorites,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
