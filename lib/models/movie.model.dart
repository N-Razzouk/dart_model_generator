/// The movie schema defines the structure of a movie.
class MovieModel {
  /// Constructor for [MovieModel].
  MovieModel({
    required this.title,
    required this.director,
    required this.releaseYear,
    required this.genre,
    required this.runtime,
    required this.actors,
  });

  /// The title of the movie.
  final String title;

  /// The director of the movie.
  final String director;

  /// The year the movie was released.
  final int releaseYear;

  /// The genre of the movie.
  final String genre;

  /// The duration of the movie in minutes.
  final int runtime;

  /// List of actors in the movie.
  final List<String> actors;

  /// Maps the class from a map of [String, dynamic].
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        title: json['title'] as String,
        director: json['director'] as String,
        releaseYear: json['release_year'] as int,
        genre: json['genre'] as String,
        runtime: json['runtime'] as int,
        actors: json['actors'] as List<String>,
      );

  /// Maps the class to a map of [String, dynamic].
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'director': director,
        'release_year': releaseYear,
        'genre': genre,
        'runtime': runtime,
        'actors': actors,
      };

  /// CopyWith method for [MovieModel].
  MovieModel copyWith({
    String? title,
    String? director,
    int? releaseYear,
    String? genre,
    int? runtime,
    List<String>? actors,
  }) =>
      MovieModel(
        title: title ?? this.title,
        director: director ?? this.director,
        releaseYear: releaseYear ?? this.releaseYear,
        genre: genre ?? this.genre,
        runtime: runtime ?? this.runtime,
        actors: actors ?? this.actors,
      );
}
