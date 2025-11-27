import 'dart:convert';

import 'package:act3_api_rest_app/src/data/datasources/base_datasource.dart';
import 'package:act3_api_rest_app/src/data/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductApiDatasource implements BaseDataSource {
  final String baseUrl = "http://localhost:3000/api/productos";

  @override
  Future<List<ProductModel>> fetchProducts() async {
    final url = Uri.parse(baseUrl);
    final resp = await http.get(url);

    if (resp.statusCode != 200) {
      throw Exception("ERROR");
    }

    final List data = json.decode(resp.body);

    return data.map((item) => ProductModel.fromJson(item)).toList();
  }
}
