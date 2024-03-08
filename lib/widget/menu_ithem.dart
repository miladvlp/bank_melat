import 'package:bank_melat/style/color.dart';
import 'package:flutter/material.dart';

class MenuIthem extends StatelessWidget {
  late Widget menu;
  late String text;
  MenuIthem({super.key, required this.menu, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 120,
        width: 95,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            const Spacer(),
            menu,
            const Spacer(),
            Container(
              height: 20,
              width: 150,
              decoration: const BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8))),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
