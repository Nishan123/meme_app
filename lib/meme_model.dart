import 'dart:convert';
import 'package:http/http.dart' as http;

class Meme {
  final String url;
  final String title;
  final String subreddit;

  Meme({required this.url, required this.title, required this.subreddit});

  factory Meme.fromJson(Map<String, dynamic> json) {
    return Meme(
      url: json['url'],
      title: json['title'],
      subreddit: json['subreddit'] ?? 'No description available',
    );
  }
}

class MemeFetcher {
  final String apiUrl = "https://meme-api.com/gimme";

  Future<Meme> fetchMeme() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Meme.fromJson(data);
    } else {
      throw Exception("Failed to load meme");
    }
  }
}
