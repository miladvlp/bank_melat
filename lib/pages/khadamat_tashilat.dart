import 'package:bank_melat/style/color.dart';
import 'package:flutter/material.dart';

class KhadamatTashilat extends StatefulWidget {
  const KhadamatTashilat({super.key});

  @override
  State<KhadamatTashilat> createState() => _KhadamatTashilatState();
}

class _KhadamatTashilatState extends State<KhadamatTashilat> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg/4877010.jpg'), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 35,
                    decoration: const BoxDecoration(color: AppColors.appBar),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.filter_alt_rounded,
                            color: AppColors.white,
                            size: 15,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'نمایش براساس:  ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                                fontSize: 17),
                          ),
                          Text(
                            'همه حساب ها',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.yellow,
                                fontSize: 17),
                          ),
                          Spacer(),
                          Icon(
                            Icons.add_chart_rounded,
                            color: AppColors.white,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
