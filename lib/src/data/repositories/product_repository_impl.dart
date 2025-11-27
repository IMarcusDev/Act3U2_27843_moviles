import 'package:act3_api_rest_app/src/data/datasources/base_datasource.dart';
import 'package:act3_api_rest_app/src/data/repositories/base_repository.dart';
import 'package:act3_api_rest_app/src/domain/entities/product_entity.dart';

class ProductRepositoryImpl implements BaseRepository {
  final BaseDataSource ds;
  ProductRepositoryImpl(this.ds);

  @override
  Future<List<ProductEntity>> getProducts() {
    return ds.fetchProducts();
  }
}
