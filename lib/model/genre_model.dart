class Genre {
  Genre({
    required this.genreList,
  });

  List<GenreList> genreList;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        genreList: List<GenreList>.from(
            json["genreList"].map((x) => GenreList.fromJson(x))),
      );
}

class GenreList {
  GenreList({
    required this.genreName,
    required this.id,
    required this.link,
    required this.imageLink,
  });

  String genreName;
  String id;
  String link;
  String imageLink;

  factory GenreList.fromJson(Map<String, dynamic> json) => GenreList(
        genreName: json["genre_name"],
        id: json["id"],
        link: json["link"],
        imageLink: json["image_link"],
      );
}
