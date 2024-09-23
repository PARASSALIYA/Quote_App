import 'dart:core';
import 'package:quote_app/header_file.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String quoteCategory = args['category']; // Extract category from arguments
    List categoryList =
        allQuoteData.where((e) => e['category'] == quoteCategory).toList();
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          bgImage(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: s.height * 0.15,
                ),
                Text(
                  quoteCategory,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: categoryList.length,
                    itemBuilder: (BuildContext context, int index) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          // allQuotes[index].quote,
                          categoryList[index]['quote'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: selectedThemeFont,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: s.height * 0.02,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "- ${categoryList[index]['author']}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: selectedThemeFont,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: s.height * 0.09,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  ShareExtend.share(
                                    categoryList[index]['quote'],
                                    "text",
                                  );
                                },
                                icon: const Icon(
                                  Icons.share,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  favoriteQuotes.contains(categoryList[index])
                                      ? favoriteQuotes
                                          .remove(categoryList[index])
                                      : favoriteQuotes.add(categoryList[index]);
                                  setState(() {});
                                },
                                icon: (favoriteQuotes
                                        .contains(categoryList[index]))
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
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.save_alt_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
