import 'package:flutter_test/flutter_test.dart';
import 'package:fondeadora/models/quote.dart';

void main() {
  test('Quote instance from a map', () {
    // set data
    Map<String, dynamic> data = {
      'id': '123456',
      'quote': 'This is a great quote',
      'author': 'Me',
      'category': 'none',
    };
    // execute test
    var quote = Quote.fromMap(data);
    // check output
    expect(quote.category, 'none');
  });
}
