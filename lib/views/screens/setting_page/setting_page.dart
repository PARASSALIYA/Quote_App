import 'package:quote_app/header_file.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Setting Page",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 110,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  bgImage(),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.save);
                    },
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    title: const Text(
                      "Bookmarks",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      "Saved Quotes",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // content
            const ListTile(
              leading: Icon(
                Icons.link_rounded,
                color: Colors.white,
                size: 35,
              ),
              title: Text(
                "Select Content Types",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
            // reminder
            const ListTile(
              leading: Icon(
                Icons.copy_outlined,
                color: Colors.white,
                size: 35,
              ),
              title: Text(
                "Set Quote Reminders",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
            // notification
            ListTile(
              leading: const Icon(
                Icons.notifications_none_rounded,
                color: Colors.white,
                size: 35,
              ),
              title: const Text(
                "Notification",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Switch(
                value: isSwitched,
                thumbColor: const WidgetStatePropertyAll(Colors.white),
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ),
            //  Recommend
            ListTile(
              title: const Text(
                "Recommend This App",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: const Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 35,
              ),
            ),
            // rate
            ListTile(
              onTap: () {},
              title: const Text(
                "Rate Us",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: const Icon(
                Icons.star_border_purple500_rounded,
                color: Colors.white,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
