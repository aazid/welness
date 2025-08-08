class Quote {
  final String quote;
  final String author;
  final String category;

  Quote({required this.quote, required this.author, required this.category});

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      quote: map['quote'] ?? '',
      author: map['author'] ?? 'Unknown',
      category: map['category'] ?? 'General',
    );
  }

  Map<String, dynamic> toMap() {
    return {'quote': quote, 'author': author, 'category': category};
  }
}
