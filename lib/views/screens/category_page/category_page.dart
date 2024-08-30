import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:quote_app/utils/quote.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/image/3.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: s.height * 0.07,
              ),
              Text(
                category,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MasonryGridView.builder(
                    itemCount: categoryList.length,
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
                        children: [
                          Text(
                            categoryList[index]['quote'],
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: s.height * 0.02,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "- ${allQuotes[index].author}",
                              style: const TextStyle(
                                fontSize: 16,
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
        ],
      ),
    );
  }
}
