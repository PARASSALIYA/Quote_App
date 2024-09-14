import 'package:quote_app/header_file.dart';

Widget bgImage() {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(selectedTheme),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      color: Colors.black.withOpacity(0.2),
    ),
  );
}
