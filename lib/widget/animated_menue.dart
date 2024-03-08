import 'package:bank_melat/style/color.dart';
import 'package:flutter/material.dart';

class AnimatedMenu extends StatelessWidget {
  late double top;
  late double right;
  late Widget item;
  late String text;
  Duration duration;
  AnimatedMenu(
      {super.key,
      required this.top,
      required this.right,
      required this.item,
      required this.text,
      required this.duration});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      curve: Curves.easeInOut,
      top: top,
      right: right,
      child: Container(
        height: 125,
        width: 125,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: AppColors.white),
        child: Column(
          children: [
            const Spacer(),
            item,
            const Spacer(),
            Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.appBar,
                  fontSize: 17.5),
            )
          ],
        ),
      ),
    );
  }
}
