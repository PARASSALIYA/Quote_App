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
        title: const Text("😊 Quotes 😊 "),
        contentPadding: const EdgeInsets.all(16),
        children: [
          Text(quoteModel.quote),
        ],
      ),
    );
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
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...allCategories.map(
                        (e) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.category,
                              arguments: e,
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 120,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.primaries[allCategories.indexOf(e)],
                              border: Border.all(
                                // width: 2,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              e,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: MasonryGridView.builder(
                  itemCount: allQuotes.length,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      color: color[index % color.length],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(3, 3),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          allQuotes[index].quote,
                        ),
                        SizedBox(
                          height: s.height * 0.02,
                        ),
                        Text(
                          "- ${allQuotes[index].author}",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
