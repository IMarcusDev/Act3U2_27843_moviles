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
      id: json["_id"]?.toString() ?? '',   
      nombre: json["nombre"] ?? 'Sin nombre',
      precio: (json["precio"] as num).toDouble(),
      stock: (json["stock"] as num).toInt(),
      categoria: json["categoria"] ?? 'Sin categoría',
    );
  }
}