import 'package:quote_app/header_file.dart';
import 'package:quote_app/views/screens/detail_page/detail_page.dart';

class Routes {
  static String splashscreen = '/';
  static String homepage = 'homepage';
  static String category = 'category';
  static String topicpage = 'topicpage';
  static String detailpage = 'detailpage';
  static String theme = 'themepage';
}

Map<String, Widget Function(BuildContext context)> routes = {
  Routes.splashscreen: (context) => const SplashPage(),
  Routes.homepage: (context) => const HomePage(),
  Routes.category: (context) => const CategoryPage(),
  Routes.topicpage: (context) => const TopicPage(),
  // Routes.detailpage: (context) => const DetailPage(),
  Routes.theme: (context) => const ThemePage(),
};
