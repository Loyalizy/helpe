class DetailEps {
  DetailEps({
    required this.title,
    required this.baseUrl,
    required this.id,
    required this.linkStream,
    required this.mirror1,
    required this.mirror2,
    required this.mirror3,
    required this.quality,
  });

  String title;
  String baseUrl;
  String id;
  String linkStream;
  Mirror mirror1;
  Mirror mirror2;
  Mirror mirror3;
  Quality quality;

  factory DetailEps.fromJson(Map<String, dynamic> json) => DetailEps(
        title: json["title"] == null ? "?" : json["title"],
        baseUrl: json["baseUrl"],
        id: json["id"],
        linkStream: json["link_stream"],
        mirror1: Mirror.fromJson(json["mirror1"]),
        mirror2: Mirror.fromJson(json["mirror2"]),
        mirror3: Mirror.fromJson(json["mirror3"]),
        quality: Quality.fromJson(json["quality"]),
      );
}

class Mirror {
  Mirror({
    required this.quality,
    required this.mirrorList,
  });

  String quality;
  List<MirrorList> mirrorList;

  factory Mirror.fromJson(Map<String, dynamic> json) => Mirror(
        quality: json["quality"],
        mirrorList: List<MirrorList>.from(
            json["mirrorList"].map((x) => MirrorList.fromJson(x))),
      );
}

class MirrorList {
  MirrorList({
    required this.host,
    required this.id,
  });

  String host;
  String id;

  factory MirrorList.fromJson(Map<String, dynamic> json) => MirrorList(
        host: json["host"],
        id: json["id"],
      );
}

class Quality {
  Quality({
    required this.lowQuality,
    required this.mediumQuality,
    required this.highQuality,
  });

  HighQualityClass lowQuality;
  HighQualityClass mediumQuality;
  HighQualityClass highQuality;

  factory Quality.fromJson(Map<String, dynamic> json) => Quality(
        lowQuality: HighQualityClass.fromJson(json["low_quality"]),
        mediumQuality: HighQualityClass.fromJson(json["medium_quality"]),
        highQuality: HighQualityClass.fromJson(json["high_quality"]),
      );
}

class HighQualityClass {
  HighQualityClass({
    required this.quality,
    required this.size,
    required this.downloadLinks,
  });

  String quality;
  String size;
  List<DownloadLink> downloadLinks;

  factory HighQualityClass.fromJson(Map<String, dynamic> json) =>
      HighQualityClass(
        quality: json["quality"],
        size: json["size"],
        downloadLinks: List<DownloadLink>.from(
            json["download_links"].map((x) => DownloadLink.fromJson(x))),
      );
}

class DownloadLink {
  DownloadLink({
    required this.host,
    required this.link,
  });

  String host;
  String link;

  factory DownloadLink.fromJson(Map<String, dynamic> json) => DownloadLink(
        host: json["host"],
        link: json["link"],
      );
}
