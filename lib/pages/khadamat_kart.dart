import 'package:bank_melat/style/color.dart';
import 'package:bank_melat/widget/list_ithem_deposit.dart';
import 'package:flutter/material.dart';

class KhadamatKart extends StatefulWidget {
  const KhadamatKart({super.key});

  @override
  State<KhadamatKart> createState() => _KhadamatKartState();
}

class _KhadamatKartState extends State<KhadamatKart> {
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
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        'معمولی',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: convert
                                              ? AppColors.red
                                              : AppColors.textgray,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.black),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text('شماره کارت'),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 6),
                                      child: Text(
                                        '۱۲۳۴۵۶۷۵۴۸۹۰۳۵۳۷',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18),
                                  child: Column(
                                    children: [
                                      IthemDeposit(
                                          visib: convert,
                                          title: 'وضعیت کارت',
                                          description: 'فعال'),
                                      IthemDeposit(
                                          visib: convert,
                                          title: 'استفاده کننده',
                                          description: 'صاحب اصلی'),
                                      IthemDeposit(
                                          visib: convert,
                                          title: 'سقف برداشت ماهانه',
                                          description: 'ندارد'),
                                      IthemDeposit(
                                          visib: convert,
                                          title: 'حساب اصلی کارت',
                                          description: '۱۲۷۶۰۶۴۸۲۳'),
                                      IthemDeposit(
                                          visib: convert,
                                          title: 'تریخ انقضاء',
                                          description: '۱۴۰۸/۱۱/۱۱'),
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
