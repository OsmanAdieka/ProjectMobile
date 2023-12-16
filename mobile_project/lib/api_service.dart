import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'Models/Api_service_models.dart';

class ApiService extends GetxController {
  static const String _baseUrl = 'https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=EmNpuEG2ky9TrMmGCaxLuZgoTfQ44qUw';
  static const String _apiKey = 'EmNpuEG2ky9TrMmGCaxLuZgoTfQ44qUw'; //API KEY yang sudah didapat
  static const String _category = 'business';
  static const String _country = 'us'; //us maksudnya United States ya
  RxList<Article> articles = RxList<Article>([]);
  RxBool isLoading = false.obs; // Observable boolean for loading state
  static final http.Client _client = http.Client();
  Future<List<Article>> fetchArticles() async {
    try {
      isLoading.value = true; // Set loading state to true
      final response = await _client.get(Uri.parse(
          '${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey'));
      if (response.statusCode == 200) {
        final jsonData = response.body;
        final articlesResult = ArticlesResult.fromJson(json.decode(jsonData));
        articles.value = articlesResult.articles;
        return articlesResult.articles;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('An error occurred: $e');
      return [];
    } finally {
      isLoading.value = false; // Set loading state to false when done
    }
  }
}
