import 'package:quote_app/header_file.dart';

import '../views/screens/category_page/category_page.dart';
import '../views/screens/theme_page/theme_page.dart';
import '../views/screens/topic_page/topic_page.dart';

class Routes {
  static String splashscreen = '/';
  static String homepage = 'homepage';
  static String category = 'category';
  static String topicpage = 'topicpage';
  static String theme = 'themepage';
}

Map<String, Widget Function(BuildContext context)> routes = {
  Routes.splashscreen: (context) => const SplashPage(),
  Routes.homepage: (context) => const HomePage(),
  Routes.category: (context) => const CategoryPage(),
  Routes.topicpage: (context) => const TopicPage(),
  Routes.theme: (context) => const ThemePage(),
};
