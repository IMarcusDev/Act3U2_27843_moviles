import 'package:act3_api_rest_app/src/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.nombre,
    required super.precio,
    required super.stock,
    required super.categoria,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      nombre: json["nombre"],
      precio: json["precio"],
      stock: json["stock"],
      categoria: json["categoria"],
    );
  }
}
