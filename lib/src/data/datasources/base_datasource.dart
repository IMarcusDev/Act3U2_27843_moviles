import 'package:act3_api_rest_app/src/data/models/product_model.dart';

abstract class BaseDataSource {
  Future<List<ProductModel>> fetchProducts();
}
