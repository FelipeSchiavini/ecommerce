

import 'package:web/models/blocs.model.dart';

class CartRepository {
  final List<Product> _product = [];

    List<Product> loadClients() {
    _product.addAll([
      Product(name: 'José Armando', price: '100.00'),
      Product(name: 'Anastácia Silva', price: '100.00'),
      Product(name: 'Marineiva Gonçalvez', price: '100.00'),
      Product(name: 'Bruno Marcondez', price: '100.00'),
    ]);
    return _product;
  }

  List<Product> addProduct(Product product) {
    _product.add(product);
    return _product;
  }

  List<Product> removeProduct(Product product) {
    _product.remove(product);
    return _product;
  }
}