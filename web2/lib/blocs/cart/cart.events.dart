


import 'package:web/models/blocs.model.dart';

abstract class CartEvent {}

class LoadCartEvent extends CartEvent {
  
}

class AddCartEvent extends CartEvent {
  Product product;

  AddCartEvent({
    required this.product,
  });
}

class RemoveCartEvent extends CartEvent {
  Product product;

  RemoveCartEvent({
    required this.product,
  });
}