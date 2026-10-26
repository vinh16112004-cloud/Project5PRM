import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/photo.dart';

class ApiService {
  static const String endpoint = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<Photo>> fetchPhotos() async {
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((item) => Photo.fromJson(item)).toList();
    } else {
      throw Exception('Không thể tải danh sách ảnh từ API');
    }
  }
}