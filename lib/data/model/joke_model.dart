import 'package:equatable/equatable.dart';

import 'package:chuck_norris_jokes/domain/entities/joke.dart';

class JokeModel extends Equatable {
  const JokeModel({
    required this.id,
    required this.iconUrl,
    required this.value,
    this.url,
  });

  final String iconUrl;
  final String id;
  final String value;

  final String? url;

  factory JokeModel.fromJson(Map<String, dynamic> json) => JokeModel(
        id: json['id'],
        iconUrl: json['icon_url'],
        value: json['value'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'icon_url': iconUrl,
        'value': value,
        'url': url,
      };

  Joke toEntity() => Joke(
        id: id,
        iconUrl: iconUrl,
        value: value,
        url: url,
      );

  @override
  List<Object?> get props => [
        id,
        iconUrl,
        value,
        url,
      ];
}
