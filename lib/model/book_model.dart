class Book {
  final String title;
  final String author;
  final String? coverUrl;

  Book({required this.title, required this.author, this.coverUrl});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(title: json['title'] ?? '', author: json['author'] ?? '', coverUrl: json['coverUrl']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'author': author, 'coverUrl': coverUrl};
  }
}
