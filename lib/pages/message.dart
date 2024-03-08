import 'package:bank_melat/style/color.dart';
import 'package:bank_melat/widget/animated_menue.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({Key? key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  late bool item = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        item = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        // actions: const [
        //   Row(
        //     children: [
        //       Icon(
        //         Icons.question_mark_outlined,
        //         color: AppColors.gray,
        //         size: 25,
        //       ),
        //       SizedBox(
        //         width: 25,
        //       ),
        //       Icon(
        //         Icons.mic,
        //         color: AppColors.white,
        //         size: 25,
        //       ),
        //     ],
        //   ),
        // ],
        title: const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Text(
            'همراه بانک ملت',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontSize: 23),
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 8,
      ),
      drawer: Drawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg/4877010.jpg'),
              fit: BoxFit.cover,
              opacity: 0.75),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              children: [
                Container(
                  height: 30,
                  decoration: const BoxDecoration(color: AppColors.appBar),
                  child: const Row(
                    children: [
                      Spacer(),
                      Text(
                        'بایگانی',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.yellow,
                            fontSize: 18),
                      ),
                      Spacer(),
                      Icon(
                        Icons.search,
                        color: AppColors.white,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
            AnimatedMenu(
                top: !item ? 900 : 40,
                right: 10,
                duration: const Duration(milliseconds: 300),
                item: Image.asset(
                  'assets/icon/credit-card_6136577.png',
                  color: AppColors.appBar,
                  scale: 10,
                ),
                text: 'انتقال وجه'),
            AnimatedMenu(
                top: !item ? 900 : 40,
                right: 145,
                duration: const Duration(milliseconds: 500),
                item: Image.asset(
                  'assets/icon/bill_910692.png',
                  color: AppColors.appBar,
                  scale: 10,
                ),
                text: 'پرداخت قبوض'),
            AnimatedMenu(
                top: !item ? 900 : 40,
                right: 280,
                duration: const Duration(milliseconds: 700),
                item: Image.asset(
                  'assets/icon/hand_1235446.png',
                  color: AppColors.appBar,
                  scale: 10,
                ),
                text: 'بازپرداخت اقساط'),
            AnimatedMenu(
                top: !item ? 900 : 175,
                right: 10,
                duration: const Duration(milliseconds: 700),
                item: Image.asset(
                  'assets/icon/sim-card_5889955.png',
                  color: AppColors.appBar,
                  scale: 10,
                ),
                text: 'خدمات شارژ'),
            AnimatedMenu(
                top: !item ? 900 : 175,
                right: 145,
                duration: const Duration(milliseconds: 900),
                item: Image.asset(
                  'assets/icon/credit-card_4021708.png',
                  color: AppColors.appBar,
                  scale: 10,
                ),
                text: 'خدمات کارت'),
            AnimatedMenu(
                top: !item ? 900 : 175,
                right: 280,
                duration: const Duration(milliseconds: 1000),
                item: Image.asset(
                  'assets/icon/money_2454282.png',
                  color: AppColors.appBar,
                  scale: 10,
                ),
                text: 'بانک پرداخت'),
            AnimatedMenu(
                top: !item ? 900 : 310,
                right: 10,
                duration: const Duration(milliseconds: 1000),
                item: Image.asset(
                  'assets/icon/contract_13072146.png',
                  color: AppColors.appBar,
                  scale: 10,
                ),
                text: 'مدیریت چک'),
            AnimatedMenu(
                top: !item ? 900 : 310,
                right: 145,
                duration: const Duration(milliseconds: 1200),
                item: Image.asset(
                  'assets/icon/message_7177374.png',
                  color: AppColors.appBar,
                  scale: 10,
                ),
                text: 'سایر')
          ],
        ),
      ),
    );
  }
}
