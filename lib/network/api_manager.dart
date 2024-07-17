import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../models/product_model.dart';

class ApiManager {
  final pageApiUrl = Constants.baseUrl;

  Future<List<Product>> getPageUrl() async {
    final response = await http.get(Uri.parse(pageApiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['products'];
      List<Product> products = data.map((product) => Product.fromJson(product)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
