

import 'package:web/models/blocs.model.dart';



abstract class CartState {
  List<Product> products;

  CartState({
    required this.products,
  });
}

class CartInitialState extends CartState {
  CartInitialState() : super(products: []);
}

class CartSuccessState extends CartState {
  CartSuccessState({required List<Product> products}) : super(products: products);
}