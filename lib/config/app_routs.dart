
import 'package:bank_melat/pages/home_page.dart';
import 'package:bank_melat/pages/login_page.dart';

class AppRouts {
  static final pages = {
    '/': (context) => const LoginPage(),
    'HomePage': (context) => const HomePage(),
  };
}
