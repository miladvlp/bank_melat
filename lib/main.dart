import 'package:bank_melat/config/app_routs.dart';
import 'package:bank_melat/style/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Sans',
        scaffoldBackgroundColor: AppColors.gray,
      ),
      initialRoute: '/',
      routes: AppRouts.pages,
    );
  }
}
