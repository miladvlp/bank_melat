import 'package:bank_melat/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemDrawer extends StatelessWidget {
  late String text;
  late Color? colr;
  late String? image;
  bool? visib;
  late bool visibimage;
  IconData? icon;
  ItemDrawer(
      {super.key,
      required this.text,
      this.colr,
      this.image,
      this.visib,
      required this.visibimage,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          visibimage
              ? Image.asset(
                  image ?? 'assets/icon/bill_910692.png',
                  color: AppColors.appBar,
                  scale: 25,
                )
              : Icon(
                  icon,
                  size: 17,
                  color: AppColors.gray,
                ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 3,
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: colr ?? AppColors.gray),
            ),
          ),
          const Spacer(),
          Visibility(
              visible: visib ?? true, child: const Icon(Icons.arrow_right))
        ],
      ),
    );
    ;
  }
}
