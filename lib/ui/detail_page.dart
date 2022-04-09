import 'dart:ui';
import 'package:AnimeTare/ui/genre_detail_page.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:AnimeTare/data/api/api_service.dart';
import 'package:AnimeTare/model/detail_model.dart';
import 'package:AnimeTare/model/home_model.dart';
import 'package:AnimeTare/style/const.dart';
import 'package:AnimeTare/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class DetailPage extends StatefulWidget {
  String id;
  DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context,
          AsyncSnapshot<AsyncSnapshot<Map<String, dynamic>>> subString) {
        return FutureBuilder(
          future: ApiService().detailAnimeApi(widget.id),
          builder: (BuildContext context, AsyncSnapshot<DetailAnime> snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                backgroundColor: darkColor,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                ),
                body: ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    Stack(
                      children: [
                        Stack(children: [
                          Container(
                            width: 500,
                            height: 300,
                            child: Image.network(
                              snapshot.data!.thumb,
                              fit: BoxFit.cover,
                            ),
                          ),
                          BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 8,
                              sigmaY: 8,
                            ),
                            child: Container(
                              color: Colors.black,
                            ),
                          ),
                        ]),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 200),
                          width: 400,
                          height: 250,
                          // color: Colors.black,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      snapshot.data!.thumb,
                                    ),
                                  ),
                                ),
                                // margin: EdgeInsets.only(top: 230),
                                width: 150,
                                height: 240,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 200,
                                    height: 100,
                                    // color: Colors.white,
                                    margin: EdgeInsets.only(
                                      left: 5,
                                      top: 50,
                                    ),
                                    child: Text(
                                      snapshot.data!.title,
                                      style:
                                          textTitle.copyWith(color: Colors.red),
                                      maxLines: 3,
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    height: 40,
                                    // color: Colors.black,
                                    margin: EdgeInsets.only(
                                      left: 5,
                                    ),
                                    child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: snapshot.data!.genreList
                                            .map((e) => InkWell(
                                                  onTap: () => Get.to(GenreDetail(
                                                      id: "${e.genreName.toLowerCase()}/",
                                                      genre: e.genreName)),
                                                  child: Container(
                                                    // width: 30,
                                                    // height: 30,
                                                    padding: EdgeInsets.all(5),
                                                    margin: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        color: Colors.redAccent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Text(
                                                      e.genreName,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ))
                                            .toList()),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: ExpandableText(
                        snapshot.data!.synopsis,
                        style: textTitle.copyWith(fontSize: 15),
                        collapseText: "Show less",
                        expandText: "Show More",
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Episode",
                        style: textTitle,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 300,
                      height: 250,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: detailEpisode(snapshot)),
                    )
                  ],
                ),
              );
            } else {
              return Scaffold(
                backgroundColor: darkColor,
              );
            }
          },
        );
      },
    );
  }

  Widget detailEpisode(AsyncSnapshot<DetailAnime> snapshot) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: snapshot.data!.episodeList
          .map(
            (e) => Container(
              margin: EdgeInsets.only(top: 5, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7),
                        child: SizedBox(
                          height: 65,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e.title,
                                style: textTitle.copyWith(
                                    fontSize: 17, color: Colors.black),
                                maxLines: 2,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  e.uploadedOn,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    // onTap: () => Get.to(VideoViewerpage(id: e.id)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.redAccent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_circle_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                          Text("Watch Now"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }

//   Widget episodeList(AsyncSnapshot<DetailAnime> snapshot) {
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: snapshot.data!.episodeList
//             .map((e) => SizedBox(
//                   height: 215,
//                   child: Padding(
//                     padding: EdgeInsets.all(15),
//                     child: GridView(
//                       physics: AlwaysScrollableScrollPhysics(),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 1,
//                           mainAxisExtent: 30,
//                           crossAxisSpacing: 10,
//                           mainAxisSpacing: 20),
//                       children: [
//                         InkWell(
//                           borderRadius: BorderRadius.circular(20),
//                           child: Container(
//                             color: Colors.white,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10, top: 5),
//                               child: Text(
//                                 "${snapshot.data!.episodeList}",
//                                 style: TextStyle(fontSize: 15),
//                                 textAlign: TextAlign.start,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ))
//             .toList());
//   }
}
