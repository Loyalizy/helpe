class Home {
  Home({
    required this.status,
    required this.baseUrl,
    required this.home,
  });

  String status;
  String baseUrl;
  HomeClass home;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        status: json["status"],
        baseUrl: json["baseUrl"],
        home: HomeClass.fromJson(json["home"]),
      );
}

class HomeClass {
  HomeClass({
    required this.onGoing,
    required this.complete,
  });

  List<Complete> onGoing;
  List<Complete> complete;

  factory HomeClass.fromJson(Map<String, dynamic> json) => HomeClass(
        onGoing: List<Complete>.from(
            json["on_going"].map((x) => Complete.fromJson(x))),
        complete: List<Complete>.from(
            json["complete"].map((x) => Complete.fromJson(x))),
      );
}

class Complete {
  Complete({
    required this.title,
    required this.id,
    required this.thumb,
    required this.episode,
    required this.uploadedOn,
    required this.score,
    required this.link,
    required this.dayUpdated,
  });

  String title;
  String id;
  String thumb;
  String episode;
  String uploadedOn;
  double score;
  String link;
  String dayUpdated;

  factory Complete.fromJson(Map<String, dynamic> json) => Complete(
        title: json["title"],
        id: json["id"],
        thumb: json["thumb"],
        episode: json["episode"],
        uploadedOn: json["uploaded_on"],
        score: json["score"] == null ? 0 : json["score"].toDouble(),
        link: json["link"],
        dayUpdated: json["day_updated"] == null ? "null" : json["day_updated"],
      );
}
