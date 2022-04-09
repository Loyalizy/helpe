class GenresDetail {
  GenresDetail({
    required this.status,
    required this.baseUrl,
    required this.animeList,
  });

  String status;
  String baseUrl;
  List<AnimeList> animeList;

  factory GenresDetail.fromJson(Map<String, dynamic> json) => GenresDetail(
        status: json["status"],
        baseUrl: json["baseUrl"],
        animeList: List<AnimeList>.from(
            json["animeList"].map((x) => AnimeList.fromJson(x))),
      );
}

class AnimeList {
  AnimeList({
    required this.animeName,
    required this.thumb,
    required this.link,
    required this.id,
    required this.studio,
    required this.episode,
    required this.score,
    required this.releaseDate,
    required this.genreList,
  });

  String animeName;
  String thumb;
  String link;
  String id;
  String studio;
  String episode;
  double score;
  String releaseDate;
  List<GenreList> genreList;

  factory AnimeList.fromJson(Map<String, dynamic> json) => AnimeList(
        animeName: json["anime_name"],
        thumb: json["thumb"],
        link: json["link"],
        id: json["id"],
        studio: json["studio"],
        episode: json["episode"],
        score: json["score"] == null ? 0.toDouble() : json["score"].toDouble(),
        releaseDate: json["release_date"],
        genreList: List<GenreList>.from(
            json["genre_list"].map((x) => GenreList.fromJson(x))),
      );
}

class GenreList {
  GenreList({
    required this.genreName,
    required this.genreLink,
    required this.genreId,
  });

  String genreName;
  String genreLink;
  String genreId;

  factory GenreList.fromJson(Map<String, dynamic> json) => GenreList(
        genreName: json["genre_name"],
        genreLink: json["genre_link"],
        genreId: json["genre_id"],
      );
}
