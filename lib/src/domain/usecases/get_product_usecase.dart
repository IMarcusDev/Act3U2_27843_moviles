import 'package:act3_api_rest_app/src/data/repositories/base_repository.dart';
import 'package:act3_api_rest_app/src/domain/entities/product_entity.dart';

class GetProductUsecase {
  final BaseRepository repo;

  GetProductUsecase(this.repo);

  Future<List<ProductEntity>> call(){
    return repo.getProducts();
  }
}
