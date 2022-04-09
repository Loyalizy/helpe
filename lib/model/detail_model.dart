class DetailAnime {
  DetailAnime({
    required this.thumb,
    required this.animeId,
    required this.synopsis,
    required this.title,
    required this.japanase,
    required this.score,
    required this.producer,
    required this.type,
    required this.status,
    required this.totalEpisode,
    required this.duration,
    required this.releaseDate,
    required this.studio,
    required this.genreList,
    required this.episodeList,
    required this.batchLink,
  });

  String thumb;
  String animeId;
  String synopsis;
  String title;
  String japanase;
  double score;
  String producer;
  String type;
  String status;
  int totalEpisode;
  String duration;
  String releaseDate;
  String studio;
  List<GenreList> genreList;
  List<EpisodeList> episodeList;
  BatchLink batchLink;

  factory DetailAnime.fromJson(Map<String, dynamic> json) => DetailAnime(
        thumb: json["thumb"],
        animeId: json["anime_id"],
        synopsis: json["synopsis"],
        title: json["title"],
        japanase: json["japanase"],
        score: json["score"] == null ? 0 : json["score"],
        producer: json["producer"],
        type: json["type"],
        status: json["status"],
        totalEpisode: json["total_episode"] == null ? 0 : json["total_episode"],
        duration: json["duration"],
        releaseDate: json["release_date"],
        studio: json["studio"],
        genreList: List<GenreList>.from(json["genre_list"] == null
            ? <GenreList>[]
            : json["genre_list"].map((x) => GenreList.fromJson(x))),
        episodeList: List<EpisodeList>.from(
            json["episode_list"].map((x) => EpisodeList.fromJson(x))),
        batchLink: BatchLink.fromJson(json["batch_link"]),
      );
}

class BatchLink {
  BatchLink({
    required this.id,
    required this.link,
  });

  String id;
  String link;

  factory BatchLink.fromJson(Map<String, dynamic> json) => BatchLink(
        id: json["id"],
        link: json["link"],
      );
}

class EpisodeList {
  EpisodeList({
    required this.title,
    required this.id,
    required this.link,
    required this.uploadedOn,
  });

  String title;
  String id;
  String link;
  String uploadedOn;

  factory EpisodeList.fromJson(Map<String, dynamic> json) => EpisodeList(
        title: json["title"],
        id: json["id"],
        link: json["link"],
        uploadedOn: json["uploaded_on"],
      );
}

class GenreList {
  GenreList({
    required this.genreName,
    required this.genreId,
    required this.genreLink,
  });

  String genreName;
  String genreId;
  String genreLink;

  factory GenreList.fromJson(Map<String, dynamic> json) => GenreList(
        genreName: json["genre_name"],
        genreId: json["genre_id"],
        genreLink: json["genre_link"],
      );
}
