import 'package:quote_app/header_file.dart';

Widget bgImage() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('lib/assets/image/bg.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      color: Colors.black.withOpacity(0.2),
    ),
  );
}
