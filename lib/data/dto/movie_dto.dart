class MovieDto {
  final int id;
  final String title;
  final String releaseDate;
  final String overview;
  final double rating;
  final String posterPath;

  MovieDto({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.rating,
    required this.posterPath,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) {
    return MovieDto(
      id: json['id'],
      title: json['title'],
      releaseDate: json['release_date'],
      overview: json['overview'],
      rating: (json['vote_average'] as num).toDouble(),
      posterPath: json['poster_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'release_date': releaseDate,
      'overview': overview,
      'vote_average': rating,
      'poster_path': posterPath,
    };
  }
}
