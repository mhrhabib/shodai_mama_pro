import 'dart:convert';

import '../models/item.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'https://picsum.photos/v2/list';

  Future<List<Item>> fetchItems(int pageNumber) async {
    final url = Uri.parse(ApiService.baseUrl + "?page=$pageNumber&limit=20");
    final response = await http.get(url);
    List<Item> items = [];
    if (response.statusCode == 200) {
      List body = json.decode(response.body);
      for (var item in body) {
        items.add(Item.fromJson(item));
      }
      return items;
    } else {
      throw Exception('failed to load data');
    }
  }
}
