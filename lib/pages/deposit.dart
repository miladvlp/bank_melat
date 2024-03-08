import 'dart:convert';

import 'package:bank_melat/style/color.dart';
import 'package:bank_melat/widget/list_ithem_deposit.dart';
import 'package:flutter/material.dart';

class Deposit extends StatefulWidget {
  const Deposit({super.key});

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  late bool convert = false;
  late bool refresh = false;
  // late bool openMenu = false;

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
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 4),
                          onTap: () {
                            setState(() {
                              convert = !convert;
                            });
                          },
                          title: AnimatedContainer(
                            duration: const Duration(microseconds: 750),
                            height: convert ? 350 : 125,
                            decoration:
                                const BoxDecoration(color: AppColors.white),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Transform.rotate(
                                        angle: convert ? 48.72 : 0,
                                        child: Image.asset(
                                          'assets/icon/arrow_6529018.png',
                                          scale: 50,
                                          color: convert
                                              ? AppColors.red
                                              : AppColors.textgray,
                                        ),
                                      ),
                                      Text(
                                        'کوتاه مدت',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: convert
                                              ? AppColors.red
                                              : AppColors.textgray,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '9532148537',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: convert
                                              ? AppColors.red
                                              : AppColors.textgray,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      child: Text('موجودی'),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6),
                                      child: Text(
                                        refresh
                                            ? '11,1458,000,00'
                                            : 'نیاز به بروزرسانی',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 45,
                                      decoration: const BoxDecoration(
                                        color: AppColors.appBar,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(45),
                                          bottomRight: Radius.circular(45),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'ریال',
                                          style:
                                              TextStyle(color: AppColors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18),
                                  child: Column(
                                    children: [
                                      IthemDeposit(
                                          visib: convert,
                                          title: 'موجودی قابل برداشت',
                                          description: refresh
                                              ? '11,1448,000,00\t ریال'
                                              : 'نیاز به بروز رسانی\t ریال'),
                                      IthemDeposit(
                                          visib: convert,
                                          title: 'شعبه افتتاح کننده',
                                          description: 'یه جای دور'),
                                      IthemDeposit(
                                          visib: convert,
                                          title: 'تاریخ آخرین گردش',
                                          description: '1402/09/09'),
                                      IthemDeposit(
                                          visib: convert,
                                          title: 'شماره شبا',
                                          description:
                                              'IR 16078080000008496325'),
                                      IthemDeposit(
                                          visib: convert,
                                          title: 'نوع حساب',
                                          description: 'حساب'),
                                      IthemDeposit(
                                          visib: convert,
                                          title: 'نرخ سود',
                                          description: '٪ 7'),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: AppColors.container,
                                        borderRadius:
                                            BorderRadius.circular(45)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return const AlertDialog(
                                                    scrollable: true,
                                                    content: Column(
                                                      children: [
                                                        CircularProgressIndicator(
                                                          color:
                                                              AppColors.black,
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          'لطفا شکیبا باشید',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: AppColors
                                                                  .black),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                });
                                            Future.delayed(
                                                const Duration(seconds: 1), () {
                                              Navigator.pop(context);
                                              setState(() {
                                                refresh = true;
                                              });
                                            });
                                          },
                                          child: const Text(
                                            'بروزرسانی',
                                            style: TextStyle(fontSize: 17),
                                          ),
                                        ),
                                        Container(
                                          height: 20,
                                          width: 1.2,
                                          color: AppColors.black,
                                        ),
                                        const Text(
                                          'گردش حساب',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Container(
                                          height: 20,
                                          width: 1.2,
                                          color: AppColors.black,
                                        ),
                                        const Text(
                                          'سرویس ها',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // const Spacer(),
                  // InkWell(
                  //   onTap: () {
                  //     setState(() {
                  //       openMenu = !openMenu;
                  //     });
                  //   },
                  // child: Stack(
                  //   children: [
                  //             Transform.scale(
                  //               scaleX: 13,
                  //               child: AnimatedContainer(
                  //                 duration: const Duration(microseconds: 1500),
                  //                 curve: Curves.easeIn,
                  //                 height: openMenu ? 75 : 24,
                  //                 width: 40,
                  //                 decoration: const BoxDecoration(
                  //                     borderRadius: BorderRadius.only(
                  //                         topLeft: Radius.circular(90),
                  //                         topRight: Radius.circular(90)),
                  //                     color: AppColors.red),
                  //               ),
                  //             ),
                  //             Column(
                  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //               children: [
                  //                 Icon(
                  //                   openMenu
                  //                       ? Icons.keyboard_arrow_down_sharp
                  //                       : Icons.keyboard_arrow_up,
                  //                   color: AppColors.white,
                  //                 )
                  //               ],
                  //             ),
                  //             Visibility(
                  //               visible: openMenu,
                  //               child: const Expanded(
                  //                 child: SingleChildScrollView(
                  //                   scrollDirection: Axis.horizontal,
                  //                   child: Row(
                  //                     children: [
                  //                       Icon(
                  //                         Icons.card_membership,
                  //                         color: AppColors.white,
                  //                         size: 25,
                  //                       ),
                  //                       Icon(
                  //                         Icons.card_membership,
                  //                         color: AppColors.white,
                  //                         size: 25,
                  //                       ),
                  //                       Icon(
                  //                         Icons.card_membership,
                  //                         color: AppColors.white,
                  //                         size: 25,
                  //                       ),
                  //                       Icon(
                  //                         Icons.card_membership,
                  //                         color: AppColors.white,
                  //                         size: 25,
                  //                       ),
                  //                       Icon(
                  //                         Icons.card_membership,
                  //                         color: AppColors.white,
                  //                         size: 25,
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
