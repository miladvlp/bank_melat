import 'package:bank_melat/style/color.dart';
import 'package:flutter/material.dart';

class IthemDeposit extends StatelessWidget {
  late String title;
  late String description;
  late bool visib;
  IthemDeposit(
      {super.key,
      required this.title,
      required this.description,
      required this.visib});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visib,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          children: [
            Container(
              height: 10,
              width: 10,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.black),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textgray),
            ),
            const Spacer(),
            Text(
              description,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textgray),
            ),
          ],
        ),
      ),
    );
  }
}
