library google_search_suggestions;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';


class GoogleSearchSuggestions {
  ///Get list of string from google search suggestions by query
  Future<List<String>> fetchSuggestions(String query) async {
    List<String> suggestions = [];
    String baseUrl =
        'http://suggestqueries.google.com/complete/search?output=toolbar&ds=yt&q=';
    var client = http.Client();
    final transformer = Xml2Json();
    var response = await client.get(Uri.parse(baseUrl + query));
    var body = response.body;
    transformer.parse(body);
    var json = transformer.toGData();
    List suggestionsData = jsonDecode(json)['toplevel']['CompleteSuggestion'];
    for (var suggestion in suggestionsData) {
      suggestions.add(suggestion['suggestion']['data'].toString());
    }
    return suggestions;
  }
}
