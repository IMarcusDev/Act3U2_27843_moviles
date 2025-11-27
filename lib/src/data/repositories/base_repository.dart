import 'package:act3_api_rest_app/src/domain/entities/product_entity.dart';

abstract class BaseRepository {
  Future<List<ProductEntity>> getProducts();
}
