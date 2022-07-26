# Google Search Suggestions

[![pub package](https://img.shields.io/pub/v/google_search_suggestions.svg)](https://img.shields.io/pub/v/google_search_suggestions.svg)

A Dart package for fetching List of Search Suggestions from Google Search.

### Example

```dart
GoogleSearchSuggestions googleSearchSuggestions = GoogleSearchSuggestions();
String query = "Mo Salah";
List<String> suggestions = await googleSearchSuggestions.fetchSuggestions(query);
```