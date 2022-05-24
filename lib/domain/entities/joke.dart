class Joke {
  Joke({
    required this.iconUrl,
    required this.id,
    required this.value,
    this.url,
  });

  final String iconUrl;
  final String id;
  final String value;

  final String? url;

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
        iconUrl: json['icon_url'],
        id: json['id'],
        url: json['url'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'icon_url': iconUrl,
        'id': id,
        'url': url,
        'value': value,
      };
}
