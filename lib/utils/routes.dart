import 'package:flutter/cupertino.dart';
import 'package:quote_app/views/screens/category_page/category_page.dart';
import 'package:quote_app/views/screens/homepage/homepage.dart';
import 'package:quote_app/views/screens/splash_page/splash_page.dart';

class Routes {
  static String splashscreen = '/';
  static String homepage = 'homepage';
  static String category = 'category';
}

Map<String, Widget Function(BuildContext context)> routes = {
  Routes.splashscreen: (context) => const SplashPage(),
  Routes.homepage: (context) => const HomePage(),
  Routes.category: (context) => const CategoryPage(),
};
