import 'package:equatable/equatable.dart';

class Joke extends Equatable {
  const Joke({
    required this.id,
    required this.iconUrl,
    required this.value,
    this.url,
  });

  final String iconUrl;
  final String id;
  final String value;

  final String? url;

  @override
  List<Object?> get props => [
        id,
        iconUrl,
        value,
        url,
      ];
}
