import 'package:flutter/cupertino.dart';
import 'package:voicenews/res/colors/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  const CustomButton({Key? key, required this.text, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          height: 40,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.redColor, width: 1.6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColor.blackColor),
                ),
              ),
              const Icon(
                CupertinoIcons.play_arrow_solid,
                color: AppColor.redColor,
              ),
            ],
          )),
    );
  }
}
