class CompleteResult {
  CompleteResult({
    required this.status,
    required this.baseUrl,
    required this.animeList,
  });

  String status;
  String baseUrl;
  List<AnimeList> animeList;

  factory CompleteResult.fromJson(Map<String, dynamic> json) => CompleteResult(
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
    required this.score,
    required this.link,
  });

  String title;
  String id;
  String thumb;
  String episode;
  String uploadedOn;
  double score;
  String link;

  factory AnimeList.fromJson(Map<String, dynamic> json) => AnimeList(
        title: json["title"],
        id: json["id"],
        thumb: json["thumb"],
        episode: json["episode"],
        uploadedOn: json["uploaded_on"],
        score: json["score"].toDouble(),
        link: json["link"],
      );
}
