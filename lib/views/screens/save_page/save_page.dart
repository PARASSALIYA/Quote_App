import 'package:quote_app/header_file.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          bgImage(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: favoriteQuotes.length,
                itemBuilder: (BuildContext context, int index) => Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${favoriteQuotes[index].quote}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${favoriteQuotes[index].category}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            favoriteQuotes.contains(allQuotes[index])
                                ? favoriteQuotes.remove(allQuotes[index])
                                : favoriteQuotes.add(allQuotes[index]);
                            setState(() {});
                          },
                          icon: (favoriteQuotes.contains(allQuotes[index]))
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
