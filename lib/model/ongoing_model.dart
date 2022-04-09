class Ongoing {
  Ongoing({
    required this.status,
    required this.baseUrl,
    required this.animeList,
  });

  String status;
  String baseUrl;
  List<AnimeList> animeList;

  factory Ongoing.fromJson(Map<String, dynamic> json) => Ongoing(
        status: json["status"],
        baseUrl: json["baseUrl"],
        animeList: List<AnimeList>.from(
            json["animeList"].map((x) => AnimeList.fromJson(x))),
      );
}

class AnimeList {
  AnimeList({
    required this.title,
    required this.id,
    required this.thumb,
    required this.episode,
    required this.uploadedOn,
    required this.dayUpdated,
    required this.link,
  });

  String title;
  String id;
  String thumb;
  String episode;
  String uploadedOn;
  String dayUpdated;
  String link;

  factory AnimeList.fromJson(Map<String, dynamic> json) => AnimeList(
        title: json["title"],
        id: json["id"],
        thumb: json["thumb"],
        episode: json["episode"],
        uploadedOn: json["uploaded_on"],
        dayUpdated: json["day_updated"],
        link: json["link"],
      );
}
