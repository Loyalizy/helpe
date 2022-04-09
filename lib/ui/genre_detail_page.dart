import 'package:AnimeTare/style/const.dart';
import 'package:flutter/material.dart';

class GenreDetail extends StatefulWidget {
  String id;
  String genre;
  GenreDetail({Key? key, required this.id, required this.genre})
      : super(key: key);

  @override
  State<GenreDetail> createState() => _GenreDetailState();
}

class _GenreDetailState extends State<GenreDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: darkColor,
          title: Row(
            children: [
              Text(
                "History",
                style: textTitle,
              ),
              Icon(
                Icons.history_sharp,
                size: 32,
                color: Colors.red,
              )
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: ListView(
            children: [
              InkWell(
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://lh3.googleusercontent.com/hPOX38qh30xftFwl0dU2-eqsqmyeNyOWV4v0oZ2bUyj4AvhfuB0EGyH0ifF0OMM99ks=w300",
                        height: 150,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10, top: 2, right: 5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Judul Anime",
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.computer,
                                      size: 20,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Episode",
                                    )
                                  ],
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
