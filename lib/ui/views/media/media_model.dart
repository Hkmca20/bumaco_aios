// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

MediaModel mediaModelFromJson(String str) =>
    MediaModel.fromJson(json.decode(str));

String mediaModelToJson(MediaModel data) => json.encode(data.toJson());

class MediaModel {
  MediaModel({
    required this.categories,
  });

  List<Category> categories;

  factory MediaModel.fromJson(Map<String, dynamic> json) => MediaModel(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    required this.name,
    required this.videos,
  });

  String name;
  List<Video> videos;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
      };
}

class Video {
  Video({
    required this.description,
    required this.sources,
    required this.subtitle,
    required this.thumb,
    required this.title,
  });

  String description;
  List<String> sources;
  Subtitle? subtitle;
  String thumb;
  String title;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        description: json["description"],
        sources: List<String>.from(json["sources"].map((x) => x)),
        subtitle: subtitleValues.map[json["subtitle"]],
        thumb: json["thumb"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "sources": List<dynamic>.from(sources.map((x) => x)),
        "subtitle": subtitleValues.reverse[subtitle],
        "thumb": thumb,
        "title": title,
      };
}

enum Subtitle { BY_BLENDER_FOUNDATION, BY_GOOGLE, BY_GARAGE419 }

final subtitleValues = EnumValues({
  "By Blender Foundation": Subtitle.BY_BLENDER_FOUNDATION,
  "By Garage419": Subtitle.BY_GARAGE419,
  "By Google": Subtitle.BY_GOOGLE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => new MapEntry(v, k));
    return reverseMap;
  }
}
