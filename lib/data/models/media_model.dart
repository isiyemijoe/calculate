// To parse this JSON data, do
//
//     final mediaModel = mediaModelFromMap(jsonString);

import 'dart:convert';

import 'dart:developer';

MediaModel mediaModelFromMap(String str) => MediaModel.fromMap(json.decode(str));

String mediaModelToMap(MediaModel data) => json.encode(data.toMap());

class MediaModel {
  MediaModel({
    required this.href,
    required this.data,
    required this.links,
  });

  String href;
  List<Datum> data;
  List<Link> links;

  factory MediaModel.fromMap(Map<String, dynamic> json) => MediaModel(
    href: json["href"] == null ? null : json["href"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    links: json["links"] == null ? [] : List<Link>.from(json["links"].map((x) => Link.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "href": href == null ? null : href,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toMap())),
    "links": links == null ? null : List<dynamic>.from(links.map((x) => x.toMap())),
  };
}

class Datum {
  Datum({
    this.album,
    this.center,
    this.title,
    this.keywords,
    this.location,
    this.nasaId,
    this.dateCreated,
    this.mediaType,
    this.description,
  });

  List<String>? album;
  String? center;
  String? title;
  List<String>? keywords;
  String? location;
  String? nasaId;
  DateTime? dateCreated;
  String? mediaType;
  String? description;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    album: json["album"] == null ? null : List<String>.from(json["album"].map((x) => x)),
    center: json["center"] == null ? null : json["center"],
    title: json["title"] == null ? null :  """${json["title"]}""",
    keywords: json["keywords"] == null ? null : List<String>.from(json["keywords"].map((x) => x)),
    location: json["location"] == null ? null : json["location"],
    nasaId: json["nasa_id"] == null ? null : json["nasa_id"],
    dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
    mediaType: json["media_type"] == null ? null : json["media_type"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toMap() => {
    "album": album == null ? null : List<dynamic>.from(album!.map((x) => x)),
    "center": center == null ? null : center,
    "title": title == null ? null : title,
    "keywords": keywords == null ? null : List<dynamic>.from(keywords!.map((x) => x)),
    "location": location == null ? null : location,
    "nasa_id": nasaId == null ? null : nasaId,
    "date_created": dateCreated == null ? null : dateCreated!.toIso8601String(),
    "media_type": mediaType == null ? null : mediaType,
    "description": description == null ? null : description,
  };
}

class Link {
  Link({
    required  this.href,
    required  this.rel,
    required  this.render,
  });

  String href;
  String rel;
  String render;

  factory Link.fromMap(Map<String, dynamic> json) => Link(
    href: json["href"] == null ? null : json["href"],
    rel: json["rel"] == null ? null : json["rel"],
    render: json["render"] == null ? null : json["render"],
  );

  Map<String, dynamic> toMap() => {
    "href": href == null ? null : href,
    "rel": rel == null ? null : rel,
    "render": render == null ? null : render,
  };
}
