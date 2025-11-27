import 'dart:convert';
import 'package:act3_api_rest_app/src/data/datasources/base_datasource.dart';
import 'package:act3_api_rest_app/src/data/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductApiDatasource implements BaseDataSource {
  // Recuerda usar 10.0.2.2 para Android Emulator
  final String baseUrl = "http://192.168.1.175:3000/api/productos"; 

  @override
  Future<List<ProductModel>> fetchProducts() async {
    final url = Uri.parse(baseUrl);
    final resp = await http.get(url);

    if (resp.statusCode != 200) {
      throw Exception("ERROR en la petición: ${resp.statusCode}");
    }

    // 1. Decodificamos la respuesta como un MAPA (Objeto JSON), no como lista
    final Map<String, dynamic> jsonResponse = json.decode(resp.body);

    // 2. Extraemos la lista que está dentro de la propiedad 'data'
    final List data = jsonResponse['data'];

    // 3. Mapeamos la lista de datos a modelos
    return data.map((item) => ProductModel.fromJson(item)).toList();
  }
}