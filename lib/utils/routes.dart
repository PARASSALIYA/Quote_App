import 'package:quote_app/header_file.dart';

class Routes {
  static String splashscreen = '/';
  static String homepage = 'homepage';
  static String category = 'category';
  static String topic = 'topicpage';
  // static String detailpage = 'detailpage';
  static String theme = 'themepage';
  static String setting = 'settingpage';
  static String save = 'savepage';
}

Map<String, Widget Function(BuildContext context)> routes = {
  Routes.splashscreen: (context) => const SplashPage(),
  Routes.homepage: (context) => const HomePage(),
  Routes.category: (context) => const CategoryPage(),
  Routes.topic: (context) => const TopicPage(),
  // Routes.detailpage: (context) => const DetailPage(),
  Routes.setting: (context) => const SettingPage(),
  Routes.save: (context) => const SavePage(),
  Routes.theme: (context) => const ThemePage(),
};
