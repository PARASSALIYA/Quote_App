import 'package:quote_app/header_file.dart';

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
