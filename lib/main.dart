import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:act3_api_rest_app/src/data/datasources/product_api_datasource.dart';
import 'package:act3_api_rest_app/src/data/repositories/product_repository_impl.dart';
import 'package:act3_api_rest_app/src/domain/usecases/get_product_usecase.dart';
import 'package:act3_api_rest_app/src/presentation/viewmodels/product_viewmodel.dart'; // Ensure this is imported
import 'src/presentation/routes/app_routes.dart';

void main() {
  final dataSource = ProductApiDatasource();
  final repo = ProductRepositoryImpl(dataSource);
  final usecase = GetProductUsecase(repo);

  runApp(MyApp(usecase: usecase));
}

class MyApp extends StatelessWidget {
  final GetProductUsecase usecase;

  const MyApp({super.key, required this.usecase});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductViewModel(usecase)..cargarProductos(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Consumo API Flutter",
        routes: AppRoutes.routes, 
      ),
    );
  }
}