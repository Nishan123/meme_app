import 'dart:convert';
import 'package:http/http.dart' as http;

class MemeFetcher {
  final String apiUrl = "https://meme-api.com/gimme";
  Future<String> fetchMeme() async{
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['url'];
    } else {
      throw Exception("Failed to load meme");
    }
  }
}
