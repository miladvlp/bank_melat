import 'package:bank_melat/style/color.dart';
import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.black,
      child: Container(
        width: 250,
        height: 900,
        color: AppColors.black,
        child: Text('data'),
      ),
    );
  }
}
