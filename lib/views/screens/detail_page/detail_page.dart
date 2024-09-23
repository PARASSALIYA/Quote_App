import 'package:quote_app/header_file.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color bgColor = Colors.black;
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    QuoteModel quote = ModalRoute.of(context)!.settings.arguments as QuoteModel;
    return Scaffold(
      body: Stack(
        children: [
          bgImage(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: s.height * 0.04,
                ),
                Center(
                  child: Text(
                    quote.category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: s.height * 0.4,
                    width: s.width,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: bgColor.withOpacity(opacity),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          quote.quote,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "~ ${quote.author}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                const Text(
                  "Background Colors",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 18,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              bgColor = Colors.primaries[index];
                              setState(() {});
                            },
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.primaries[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Text(
                  "Color Opacity :",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Slider(
                  min: 0,
                  max: 1,
                  value: opacity,
                  onChanged: (value) {
                    opacity = value;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
