import 'package:quote_app/header_file.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool like = false;
  @override
  Widget build(BuildContext context) {
    String category = ModalRoute.of(context)!.settings.arguments as String;
    List categoryList =
        allQuoteData.where((e) => e['category'] == category).toList();
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/image/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: s.height * 0.15,
                ),
                Text(
                  category,
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
                          categoryList[index]['quote'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
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
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: s.height * 0.03,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    like = !like;
                                  });
                                },
                                icon: (like)
                                    ? const Icon(
                                        Icons.favorite,
                                        size: 40,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.favorite_border,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.share,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.bookmark_border,
                                  size: 40,
                                  color: Colors.white,
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
