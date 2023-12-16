import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_project/Models/Posts.dart';

Future<Posts> fetchPosts(http.Client client) async {
  final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  if (response.statusCode == 200) {
    // Jika server memberikan respons 200 OK,
    // maka parse JSON.
    return Posts.fromJson(jsonDecode(response.body));
  } else {
    // Jika server tidak memberikan respons 200 OK,
    // maka lempar exception.
    throw Exception('Failed to load posts');
  }
}

void main() async {
  // Buat instance dari http.Client
  final client = http.Client();

  try {
    // Panggil fungsi fetchPosts dan terima hasilnya
    final posts = await fetchPosts(client);

    // Cetak hasilnya atau lakukan sesuatu yang diinginkan
    print('Post ID: ${posts.id}');
    print('Title: ${posts.title}');
    print('Body: ${posts.body}');
  } catch (e) {
    // Tangani exception jika terjadi kesalahan
    print('Error: $e');
  } finally {
    // Pastikan untuk menutup client setelah digunakan
    client.close();
  }
}
