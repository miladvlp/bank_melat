import 'package:bank_melat/pages/home.dart';
import 'package:bank_melat/pages/log_out.dart';
import 'package:bank_melat/pages/message.dart';
import 'package:bank_melat/style/color.dart';
import 'package:bank_melat/widget/item_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/widgets.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

List ithem = [
  ItemDrawer(
    text: 'انتقال وجه',
    image: 'assets/icon/credit-card_6136577.png',
    visibimage: true,
  ),
  ItemDrawer(
    text: 'نوبت دهی غیر حضوری شعب بانک',
    image: 'assets/icon/give-money_13974475.png',
    colr: AppColors.red,
    visibimage: true,
  ),
  ItemDrawer(
    text: 'واریز به حساب سازمان ها',
    image: 'assets/icon/credit-card_6136577.png',
    visib: false,
    visibimage: true,
  ),
  ItemDrawer(
    text: 'واریز به حساب سازمان ها',
    icon: Icons.business_outlined,
    visib: false,
    visibimage: false,
  ),
  ItemDrawer(
    text: 'نیکوکاری',
    icon: Icons.add_reaction_rounded,
    visib: false,
    visibimage: false,
  ),
  ItemDrawer(
    text: 'پرداخت قبوض',
    image: 'assets/icon/bill_910692.png',
    visib: false,
    visibimage: true,
  ),
  ItemDrawer(
    text: 'خدمات تسهیلات',
    icon: Icons.restore_sharp,
    visibimage: false,
  ),
  ItemDrawer(
    text: 'خدمات شارژ',
    image: 'assets/icon/sim-card_5889955.png',
    visibimage: true,
  ),
  ItemDrawer(
    text: 'مدیریت چک در صیاد',
    image: 'assets/icon/contract_13072146.png',
    visibimage: true,
  ),
  ItemDrawer(
    text: 'مدیریت چک',
    image: 'assets/icon/contract_13072146.png',
    visibimage: true,
  ),
  ItemDrawer(
    text: 'خدمات کارت',
    image: 'assets/icon/credit-card_4021708.png',
    visibimage: true,
  ),
  ItemDrawer(
    text: 'مدیریت بن کارت',
    icon: Icons.card_giftcard,
    visibimage: false,
  ),
  ItemDrawer(
    text: 'مدیریت بانکداری باز',
    icon: Icons.account_balance_outlined,
    visibimage: false,
  ),
  ItemDrawer(
    text: 'مدیریت رمز دوم کارت',
    image: 'assets/icon/credit-card_6136577.png',
    visibimage: true,
  ),
  ItemDrawer(
    text: 'استعلام',
    icon: Icons.perm_device_information_rounded,
    visibimage: false,
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late SharedPreferences _prefs;
  // late DateTime _lastLoginDateTime = DateTime.now();
  int index = 2;
  void currentIndex(value) {
    setState(() {
      index = value;
    });
  }

  List<Widget> page = [
    Container(),
    const Message(),
    const Home(),
    Container(),
    const Home()
  ];
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  void logout() {
    Future.delayed(Duration.zero, () {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const LogOut();
        },
      );
    });
  }

  late bool openMenu = false;
  // Future<void> _initPrefs() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   final lastLoginMillis = _prefs.getInt('last_login_millis') ?? 0;
  //   _lastLoginDateTime = DateTime.fromMillisecondsSinceEpoch(lastLoginMillis);
  // }

  // Future<void> _updateLastLoginDateTime() async {
  //   setState(() {
  //     _lastLoginDateTime = DateTime.now();
  //   });
  //   await _prefs.setInt(
  //       'last_login_millis', _lastLoginDateTime.millisecondsSinceEpoch);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _initPrefs();
  // }

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    final gregorianDateStart = DateTime.parse(date.toString());
    final jalaliStartDate =
        Gregorian.fromDateTime(gregorianDateStart).toJalali();
    var time = DateTime.now();
    // print(
    //   '${_lastLoginDateTime.toString()}',
    // );
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Scaffold(
                key: _drawerKey,
                body: page.elementAt(index),
                drawer: Drawer(
                  shape: const Border(),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3.5,
                        color: AppColors.appBar,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/logo/bm.png',
                              scale: 2,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'جناب آقای ......',
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 17),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'کد ملی: ',
                                  style: TextStyle(
                                      color: AppColors.white, fontSize: 17),
                                ),
                                Text(
                                  '1589627834',
                                  style: TextStyle(
                                      color: AppColors.white, fontSize: 15),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(children: [
                              const Text(
                                'زمان آخرین ورود: ',
                                style: TextStyle(
                                    color: AppColors.white, fontSize: 17),
                              ),
                              const Spacer(),
                              Text(
                                time.toString().split(' ')[1].split('.')[0],
                                style: const TextStyle(
                                    color: AppColors.white, fontSize: 15),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${jalaliStartDate.year}/${jalaliStartDate.month}/${jalaliStartDate.day}',
                                style: const TextStyle(
                                    color: AppColors.white, fontSize: 15),
                              ),
                            ])
                          ],
                        ),
                      ),
                      Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return ithem[index];
                              },
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemCount: ithem.length))
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: !openMenu ? 185 : -30,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      openMenu = !openMenu;
                    });
                  },
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Transform.scale(
                        scaleX: 11,
                        scaleY: 1.1,
                        child: AnimatedContainer(
                          duration: const Duration(microseconds: 1500),
                          curve: Curves.easeIn,
                          height: openMenu ? 75 : 23,
                          width: 60,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(90),
                                  topRight: Radius.circular(90)),
                              color: AppColors.red),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            openMenu
                                ? Icons.keyboard_arrow_down_sharp
                                : Icons.keyboard_arrow_up,
                            color: AppColors.white,
                          )
                        ],
                      ),
                      Visibility(
                        visible: openMenu,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                children: [
                                  Icon(
                                    Icons.restore,
                                    color: AppColors.white,
                                    size: 50,
                                  ),
                                  Text(
                                    'گردش حساب',
                                    style: TextStyle(
                                        color: AppColors.white, fontSize: 17),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/icon/bill_910692.png',
                                    scale: 15,
                                    color: AppColors.white,
                                  ),
                                  const Text(
                                    'پرداخت قبوض',
                                    style: TextStyle(
                                        color: AppColors.white, fontSize: 17),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/icon/sim-card_5889955.png',
                                    scale: 15,
                                    color: AppColors.white,
                                  ),
                                  const Text(
                                    'خرید شارژ',
                                    style: TextStyle(
                                        color: AppColors.white, fontSize: 17),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/icon/credit-card_4021708.png',
                                    scale: 15,
                                    color: AppColors.white,
                                  ),
                                  const Text(
                                    'حواله بانک ملت',
                                    style: TextStyle(
                                        color: AppColors.white, fontSize: 17),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/icon/credit-card_6136577.png',
                                    scale: 15,
                                    color: AppColors.white,
                                  ),
                                  const Text(
                                    'کارت به کارت',
                                    style: TextStyle(
                                        color: AppColors.white, fontSize: 17),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColors.appBar,
            ),
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                    color: index == 0 ? AppColors.yellow : AppColors.white,
                  ),
                  label: 'منو',
                ),
                BottomNavigationBarItem(
                  icon: badges.Badge(
                    position: badges.BadgePosition.topStart(),
                    badgeContent: const Text(
                      '9',
                      style: TextStyle(color: AppColors.white, fontSize: 15),
                    ),
                    child: Icon(
                      Icons.email,
                      color: index == 1 ? AppColors.yellow : AppColors.white,
                    ),
                  ),
                  label: 'ایمیل',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: index == 2 ? AppColors.yellow : AppColors.white,
                  ),
                  label: 'خانه',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon/sensor_11653381.png',
                    color: index == 3 ? AppColors.yellow : AppColors.white,
                    scale: 19,
                  ),
                  label: 'NFC',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.login,
                    color: index == 4 ? AppColors.yellow : AppColors.white,
                  ),
                  label: 'ورود',
                ),
              ],
              currentIndex: index,
              onTap: (int tappedIndex) {
                tappedIndex == 0
                    ? _drawerKey.currentState!.openDrawer()
                    : setState(() {
                        index = tappedIndex;
                      });
                if (tappedIndex == 4) {
                  logout();
                }
              },
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
          ),
        ),
      ),
    );
  }
}
