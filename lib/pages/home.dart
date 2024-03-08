import 'package:bank_melat/pages/deposit.dart';
import 'package:bank_melat/pages/drawer.dart';
import 'package:bank_melat/pages/khadamat_kart.dart';
import 'package:bank_melat/pages/khadamat_tashilat.dart';
import 'package:bank_melat/style/color.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        actions: const [
          Row(
            children: [
              Icon(
                Icons.question_mark_outlined,
                color: AppColors.gray,
                size: 25,
              ),
              SizedBox(
                width: 25,
              ),
              Icon(
                Icons.mic,
                color: AppColors.white,
                size: 25,
              ),
            ],
          ),
        ],
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
        bottom: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
              color: AppColors.red, borderRadius: BorderRadius.circular(8)),
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: const <Widget>[
            Tab(
                icon: Icon(
                  Icons.cloud_outlined,
                  size: 0,
                ),
                child: Text(
                  'خدمات سپرده',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontSize: 15),
                )),
            Tab(
                icon: Icon(
                  Icons.cloud_outlined,
                  size: 0,
                ),
                child: Text(
                  'خدمات تسهیلات',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontSize: 15),
                )),
            Tab(
                icon: Icon(
                  Icons.cloud_outlined,
                  size: 0,
                ),
                child: Text(
                  'خدمات کارت',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontSize: 15),
                )),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[Deposit(), KhadamatTashilat(), KhadamatKart()],
      ),
    );
  }
}
