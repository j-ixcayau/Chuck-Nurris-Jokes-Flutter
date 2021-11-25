import 'dart:convert';

import 'author.dart';

Joke jokeFromJson(String str) => Joke.fromJson(json.decode(str));

String jokeToJson(Joke data) => json.encode(data.toJson());

class Joke {
  Joke({
    required this.iconUrl,
    required this.id,
    required this.value,
    this.url,
    this.author,
  });

  final String iconUrl;
  final String id;
  final String value;

  final String? url;
  final Author? author;

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
        iconUrl: json["icon_url"],
        id: json["id"],
        url: json["url"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "id": id,
        "url": url,
        "value": value,
      };
}
