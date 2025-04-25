import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_model.dart';

class PostRepo {
  Future<PostModel> fetchRandomPost() async {
    final randomId = DateTime.now().second % 100 + 1; // get random-ish id
    final url = Uri.parse(
      'https://jsonplaceholder.typicode.com/posts/$randomId',
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return PostModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
