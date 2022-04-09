import 'package:AnimeTare/style/const.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  String _url =
      "https://play.google.com/store/apps/details?id=com.app.nimetarenimetarepp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://static.vecteezy.com/system/resources/previews/002/318/271/original/user-profile-icon-free-vector.jpg")),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "AnimeTare",
              style: textTitle,
            ),
            Text(
              "Version 2.5",
              style: textTitle.copyWith(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            Text(
              "Developed by IziEinstein",
              style: textTitle.copyWith(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 50.0),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text("RATE APP"),
            // )
            Link(
              uri: Uri.parse(
                  "https://play.google.com/store/apps/details?id=com.app.nimetarenimetarepp"),
              builder: (context, followLink) => ElevatedButton(
                child: Text("RATE APP"),
                onPressed: followLink,
              ),
            )
          ],
        ),
      ),
    );
  }
}
