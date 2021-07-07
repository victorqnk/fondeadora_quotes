class Quote {
  final String id;
  final String quote;
  final String author;
  final String category;

  const Quote({
    required this.id,
    required this.author,
    required this.quote,
    required this.category,
  });

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      id: map['contents']['quotes'][0]['id'],
      author: map['contents']['quotes'][0]['author'],
      quote: map['contents']['quotes'][0]['quote'],
      category: map['contents']['quotes'][0]['category'],
    );
  }
}
