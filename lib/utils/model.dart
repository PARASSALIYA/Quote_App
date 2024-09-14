class QuoteModel {
  final String quote;
  final String author;
  final String category;

  QuoteModel({
    required this.quote,
    required this.author,
    required this.category,
  });

  factory QuoteModel.fromQuoteMap({required Map<String, dynamic> quoteData}) =>
      QuoteModel(
        quote: quoteData['quote'],
        author: quoteData['author'],
        category: quoteData['category'],
      );
}
