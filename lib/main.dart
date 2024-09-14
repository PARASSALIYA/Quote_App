import 'header_file.dart';

void main() {
  runApp(
    QuoteApp(),
  );
}

class QuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Queue App',
      routes: routes,
    );
  }
}
