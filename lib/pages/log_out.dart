import 'dart:io';

import 'package:bank_melat/style/color.dart';
import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Icon(
        Icons.error_outline_sharp,
        color: AppColors.redAccent,
        size: 95,
      ),
      content: const Text(
        'کاربر گرامی آیا مایل به خروج هستید؟',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.appBar),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              child: const Text(
                'خیر',
                style: TextStyle(color: AppColors.white),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            ElevatedButton(
              onPressed: () {
                exit(0);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.red),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              child: const Text(
                'بله',
                style: TextStyle(color: AppColors.white),
              ),
            )
          ],
        )
      ],
    );
  }
}
