import 'package:act3_api_rest_app/src/domain/entities/product_entity.dart';
import 'package:act3_api_rest_app/src/domain/usecases/get_product_usecase.dart';
import 'package:act3_api_rest_app/src/presentation/viewmodels/base_viewmodel.dart';

class ProductViewModel extends BaseViewModel {
  final GetProductUsecase usecase;
  
  List<ProductEntity> products = [];

  ProductViewModel(this.usecase);

  Future<void> cargarProductos() async {
    setLoading(true);

    try {
      products = await usecase();
    } catch (e) {
      print("Error loading products: $e");
    } finally {
      setLoading(false); 
    }
  }
}