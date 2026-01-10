import 'package:flutter_test/flutter_test.dart';
import 'package:daily_quote_explorer/providers/quote_provider.dart';
import 'package:daily_quote_explorer/models/quote.dart';

void main() {
  test('Adding and removing favorites works correctly', () {
    final provider = QuoteProvider();

    final quote = Quote(
      id: 1,
      text: 'Test Quote',
      author: 'Tester',
    );

    provider.addToFavorites(quote);
    expect(provider.favorites.length, 1);

    provider.removeFromFavorites(quote);
    expect(provider.favorites.length, 0);
  });
}
