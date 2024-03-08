import 'dart:ui';
import 'package:bank_melat/style/color.dart';
import 'package:bank_melat/widget/finger_print.dart';
import 'package:bank_melat/widget/menu_ithem.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool selectColor = false;
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isChecked = false;
  bool visibButtom = true;
  bool visibBiometric = true;
  bool authenticate = false;
  late AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // bg
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/bg/59277.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            // blur bg
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectColor = false;
                      visibBiometric = !visibBiometric;
                    });
                  },
                  child: Text(
                    'Internet',
                    style: TextStyle(
                        fontSize: 17,
                        color:
                            !selectColor ? AppColors.yellow : AppColors.white),
                  ),
                ),
                Container(
                  height: 20,
                  width: 1.2,
                  color: AppColors.white,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectColor = true;
                      visibBiometric = !visibBiometric;
                    });
                  },
                  child: Text(
                    'SMS',
                    style: TextStyle(
                        fontSize: 17,
                        color:
                            selectColor ? AppColors.yellow : AppColors.white),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                  // color: AppColors.white,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/logo/bm.png",
                    ),
                  ),
                ),
              ),
              const Text(
                'همراه بانک ملت',
                style: TextStyle(
                    color: AppColors.yellow,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
              Visibility(
                  visible: !visibButtom,
                  child: const SizedBox(
                    height: 10,
                  )),
              Visibility(
                visible: !visibButtom,
                child: const Text(
                  'جهت ورود با اثر انگشت تصویر زیر را لمس نمایید.',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                ),
              ),
              Visibility(
                  visible: !visibButtom,
                  child: const SizedBox(
                    height: 10,
                  )),
              Visibility(
                visible: !visibButtom,
                child: InkWell(
                  onTap: () async {
                    setState(() {
                      visibButtom = false;
                    });
                    final isAuthenticate =
                        await FingerPrint.authenticateFunction();
                    if (isAuthenticate) {
                      Future.delayed(const Duration(milliseconds: 250), () {
                        setState(() {
                          authenticate = !authenticate;
                        });
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                scrollable: true,
                                content: Column(
                                  children: [
                                    CircularProgressIndicator(
                                      color: AppColors.black,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'لطفا شکیبا باشید',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.black),
                                    )
                                  ],
                                ),
                              );
                            });
                      });
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pushNamed(context, 'HomePage');
                      });
                    } else {}
                  },
                  child: Image.asset(
                    "assets/icon/fingerprint-scan_6692271.png",
                    scale: 3.5,
                    color: !authenticate ? AppColors.red : AppColors.green,
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 8),
                  child: Column(
                    children: [
                      Visibility(
                        visible: visibButtom,
                        child: TextField(
                          controller: _userController,
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.white, width: 2),
                              ),
                              labelText: 'نام کاربری',
                              labelStyle: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Visibility(
                        visible: visibButtom,
                        child: const SizedBox(
                          height: 10,
                        ),
                      ),
                      Visibility(
                        visible: visibButtom,
                        child: TextField(
                          controller: _passController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.white),
                              ),
                              labelText: 'رمز ورود',
                              labelStyle: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: visibButtom,
                        child: Row(
                          children: [
                            Checkbox.adaptive(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                              activeColor: AppColors.red,
                              side: const BorderSide(color: AppColors.white),
                              checkColor: Colors.white,
                            ),
                            const Text(
                              'ذخیره نام کاربری',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: visibButtom
                                  ? AppColors.red
                                  : AppColors.transparent,
                              borderRadius: BorderRadius.circular(4),
                              border: visibButtom
                                  ? null
                                  : Border.all(color: AppColors.white)),
                          child: Center(
                            child: Text(
                              visibButtom ? 'ورود' : 'ورود با نام کاربری',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: visibButtom && visibBiometric,
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              visibButtom = false;
                            });
                            final isAuthenticate =
                                await FingerPrint.authenticateFunction();
                            if (isAuthenticate) {
                              Future.delayed(const Duration(milliseconds: 250),
                                  () {
                                setState(() {
                                  authenticate = !authenticate;
                                });
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AlertDialog(
                                        scrollable: true,
                                        content: Column(
                                          children: [
                                            CircularProgressIndicator(
                                              color: AppColors.black,
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              'لطفا شکیبا باشید',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.black),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              });
                              Future.delayed(const Duration(seconds: 2), () {
                                Navigator.pushNamed(context, 'HomePage');
                              });
                            } else {}
                          },
                          child: Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.white),
                                borderRadius: BorderRadius.circular(4)),
                            child: const Center(
                              child: Text(
                                'ورود بیومتریک',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MenuIthem(
                        menu: const Text(
                          'مگابانک',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.red,
                              fontSize: 23),
                        ),
                        text: 'مگابانک'),
                    MenuIthem(
                        menu: const Icon(
                          Icons.lock_reset_rounded,
                          color: AppColors.yellow,
                          size: 45,
                        ),
                        text: 'بازنشانی رمز عبور'),
                    MenuIthem(
                        menu: const Text(
                          'فراسود ملت',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.yellow,
                              fontSize: 23),
                          textAlign: TextAlign.center,
                        ),
                        text: 'فراسود ملت'),
                    MenuIthem(
                        menu: Image.asset(
                          "assets/icon/contract_13072146.png",
                          scale: 10,
                          color: AppColors.yellow,
                        ),
                        text: 'امضای ملت'),
                    MenuIthem(
                        menu: Image.asset(
                          "assets/icon/give-money_13974475.png",
                          scale: 10,
                          color: AppColors.yellow,
                        ),
                        text: 'نوبت دهی آنلاین'),
                    MenuIthem(
                        menu: Transform.rotate(
                          angle: -45.55,
                          child: const Icon(
                            Icons.card_membership,
                            color: AppColors.yellow,
                            size: 50,
                          ),
                        ),
                        text: 'خدمات کارت'),
                    MenuIthem(
                        menu: const Icon(
                          Icons.support_agent_rounded,
                          color: AppColors.yellow,
                          size: 50,
                        ),
                        text: 'تماس با ما'),
                    MenuIthem(
                        menu: const Icon(
                          Icons.safety_check,
                          color: AppColors.yellow,
                          size: 50,
                        ),
                        text: 'نکات ایمنی'),
                    MenuIthem(
                        menu: const Text(
                          '1.3.1',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.yellow,
                              fontSize: 23),
                          textAlign: TextAlign.center,
                        ),
                        text: 'شماره نسخه'),
                  ],
                ),
              ),
              const Spacer(),
              Transform.scale(
                scaleX: 13,
                child: Container(
                  height: 20,
                  width: 40,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100)),
                      color: AppColors.red),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
