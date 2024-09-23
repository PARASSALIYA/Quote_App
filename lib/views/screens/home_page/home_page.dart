import 'dart:io';
import 'dart:ui' as ui;

import 'package:quote_app/header_file.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void showQuotes() {
    Random random = Random();
    String category = "art";

    List<QuoteModel> list = allQuotes
        .where(
          (e) => e.category == category,
        )
        .toList();
    QuoteModel quoteModel = list[random.nextInt(list.length)];

    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text(
          "Quotes",
          style: TextStyle(fontSize: 24),
        ),
        contentPadding: const EdgeInsets.all(16),
        children: [
          Text(
            quoteModel.quote,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  GlobalKey key = GlobalKey();

  Future<File> share() async {
    RenderRepaintBoundary boundary =
        key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(
      pixelRatio: 25,
    );
    ByteData? bytes = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    Uint8List uInt8list = bytes!.buffer.asUint8List();

    final Directory directory = await getTemporaryDirectory();
    File file = await File(
            "${directory.path}/QA-${DateTime.now().millisecondsSinceEpoch}.png")
        .create();
    file.writeAsBytesSync(uInt8list);

    return file;
  }

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () => showQuotes(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color(0xff000000).withOpacity(0.4),
      body: RepaintBoundary(
        key: key,
        child: Stack(
          children: [
            bgImage(),
            Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: allQuotes.length,
                      itemBuilder: (context, index) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: s.height * 0.25,
                          ),
                          Text(
                            allQuotes[index].quote,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: selectedThemeFont,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: s.height * 0.02,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "- ${allQuotes[index].author}",
                              style: TextStyle(
                                fontFamily: selectedThemeFont,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: s.height * 0.09,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    File file = await share();
                                    ShareExtend.share(
                                      file.path,
                                      "file",
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    child: const Icon(
                                      Icons.share_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    favoriteQuotes.contains(allQuotes[index])
                                        ? favoriteQuotes
                                            .remove(allQuotes[index])
                                        : favoriteQuotes.add(allQuotes[index]);
                                    setState(() {});
                                  },
                                  icon: (favoriteQuotes
                                          .contains(allQuotes[index]))
                                      ? const Icon(
                                          Icons.bookmark,
                                          size: 30,
                                          color: Colors.white,
                                        )
                                      : const Icon(
                                          Icons.bookmark_border,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    child: const Icon(
                                      Icons.save_alt_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.topic)
                              .then((value) => setState(() {}));
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Topics",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.theme)
                              .then((value) => setState(() {}));
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Themes",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.setting)
                              .then((value) => setState(() {}));
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Setting",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
