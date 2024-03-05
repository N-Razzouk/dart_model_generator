/// The book schema defines the structure of a book.
class BookModel {
  /// Constructor for [BookModel].
  BookModel({
    required this.title,
    required this.author,
    required this.publicationYear,
    required this.genre,
    required this.isbn,
  });

  /// The title of the book.
  final String title;

  /// The author of the book.
  final String author;

  /// The year the book was published.
  final int publicationYear;

  /// The genre of the book.
  final String genre;

  /// The ISBN of the book.
  final String isbn;

  /// Maps the class from a map of [String, dynamic].
  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        title: json['title'] as String,
        author: json['author'] as String,
        publicationYear: json['publication_year'] as int,
        genre: json['genre'] as String,
        isbn: json['isbn'] as String,
      );

  /// Maps the class to a map of [String, dynamic].
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'author': author,
        'publication_year': publicationYear,
        'genre': genre,
        'isbn': isbn,
      };

  /// CopyWith method for [BookModel].
  BookModel copyWith({
    String? title,
    String? author,
    int? publicationYear,
    String? genre,
    String? isbn,
  }) =>
      BookModel(
        title: title ?? this.title,
        author: author ?? this.author,
        publicationYear: publicationYear ?? this.publicationYear,
        genre: genre ?? this.genre,
        isbn: isbn ?? this.isbn,
      );
}
