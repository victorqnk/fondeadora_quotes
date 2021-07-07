import 'package:http/http.dart' as http;

class QuoteController {
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<http.Response> getQuote() async {
    var url = Uri.parse('https://quotes.rest/qod');
    var response = await http.get(url, headers: headers);
    return response;
  }
}
