// ignore_for_file: file_names, prefer_const_declarations

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/API_models.dart';

class BooksController {
  final String apiKey;
  final String apiEndpoint;

  BooksController(this.apiKey, this.apiEndpoint);

  Future<List<Book>> fetchBooks() async {
    final nytEndpoint = "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=EmNpuEG2ky9TrMmGCaxLuZgoTfQ44qUw";
    final response = await http.get(Uri.parse(nytEndpoint));

    if (response.statusCode == 200) {
      return parseBooks(response.body);
    } else {
      throw Exception('Failed to load books');
    }
  }

  List<Book> parseBooks(String responseBody) {
    final data = json.decode(responseBody);
    final parsed = data["results"]["books"].cast<Map<String, dynamic>>();
    return parsed.map<Book>((json) => Book.fromJson(json)).toList();
  }
}



