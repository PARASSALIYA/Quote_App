import 'package:quote_app/header_file.dart';

import '../components/bgimage_Widget.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          bgImage(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    height: s.height * 0.9,
                  ),
                  ...fontBg.map(
                    (e) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTheme = e['bg'];
                          selectedThemeFont = e['font'].fontFamily!;
                        });
                      },
                      child: Container(
                        height: 350,
                        width: 190,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              e['bg'],
                            ),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "ABC",
                          style: e['font'].merge(
                            const TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
