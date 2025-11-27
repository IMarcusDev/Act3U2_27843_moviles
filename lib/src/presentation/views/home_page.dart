import 'package:act3_api_rest_app/src/presentation/viewmodels/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProductViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Productos")),
      body: vm.loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: vm.products.length,
        itemBuilder: (_, i) {
          final p = vm.products[i];
          return ListTile(
            title: Text(p.nombre),
            subtitle: Text("Precio: \$${p.precio}"),
          );
        },
      ),
    );
  }
}
