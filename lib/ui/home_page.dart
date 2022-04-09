import 'package:AnimeTare/data/api/api_service.dart';
import 'package:AnimeTare/model/genre_model.dart';
import 'package:AnimeTare/model/home_model.dart';
import 'package:AnimeTare/style/const.dart';
import 'package:AnimeTare/ui/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final DetailPage id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "AnimeTare",
          style: textTitle,
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 5),
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: "Cari Anime",
                          hintStyle: TextStyle(color: Colors.redAccent),
                          icon: Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.red,
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Genres",
                      style: textTitle.copyWith(color: Colors.red),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 40,
                  child: FutureBuilder(
                    future: ApiService().genreApi(),
                    builder:
                        (BuildContext context, AsyncSnapshot<Genre> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.genreList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  margin: EdgeInsets.only(right: 8),
                                  width: 100,
                                  color: Colors.white,
                                  child: Text(
                                    snapshot.data!.genreList[index].genreName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return TextShimmer();
                      }
                      ;
                    },
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              // Container(
              //   padding: EdgeInsets.only(left: 5),
              //   height: 60,
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(30)),
              //   child: Center(
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 10),
              //       child: TextField(
              //         cursorColor: Colors.black,
              //         decoration: InputDecoration(
              //             hintText: "Cari Anime",
              //             hintStyle: TextStyle(color: Colors.redAccent),
              //             icon: Icon(
              //               Icons.search,
              //               size: 30,
              //               color: Colors.red,
              //             )),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Episode Terbaru",
                      style: textTitle.copyWith(color: Colors.red),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SizedBox(
                  height: 320,
                  child: FutureBuilder(
                    future: ApiService().homePageApi(),
                    builder:
                        (BuildContext context, AsyncSnapshot<Home> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.home.onGoing.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(right: 10.0),
                              width: 150.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.to(DetailPage(
                                      id: snapshot.data!.home.onGoing[index].id
                                          .toString(),
                                    )),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          snapshot
                                              .data!.home.onGoing[index].thumb,
                                        )),
                                  ),
                                  Container(
                                    height: 45,
                                    child: Text(
                                      snapshot.data!.home.onGoing[index].title,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                      maxLines: 2,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.computer,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      Text(
                                        snapshot
                                            .data!.home.onGoing[index].episode,
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return SizedBox(
                          height: 320,
                          child: PlayStoreShimmer(),
                        );
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Rekomendasi",
                      style: textTitle.copyWith(color: Colors.red),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 350,
                  child: FutureBuilder(
                    future: ApiService().homePageApi(),
                    builder:
                        (BuildContext context, AsyncSnapshot<Home> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.home.complete.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(right: 10),
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.to(DetailPage(
                                      id: snapshot
                                          .data!.home.complete[index].episode,
                                    )),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(snapshot
                                          .data!.home.complete[index].thumb
                                          .toString()),
                                    ),
                                  ),
                                  Container(
                                    height: 45,
                                    child: Text(
                                      snapshot.data!.home.complete[index].title,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return SizedBox(
                          height: 20,
                          child: VideoShimmer(),
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
