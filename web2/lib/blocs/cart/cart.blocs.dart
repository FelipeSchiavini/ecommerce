import 'package:bloc/bloc.dart';
import 'package:web/blocs/cart/cart.events.dart';
import 'package:web/blocs/cart/cart.state.dart';

import 'cart.repository.dart';


//https://www.youtube.com/watch?v=UukgrBIf3Cc
class CartBloc extends Bloc<CartEvent, CartState> {
  final _productsRepo = CartRepository();

  CartBloc() : super(CartInitialState()) {
    on<LoadCartEvent>(
      (event, emit) => emit(CartSuccessState(products: _productsRepo.loadClients())),
    );

    on<AddCartEvent>(
      (event, emit) => emit(CartSuccessState(products: _productsRepo.addProduct(event.product))),
    );

    on<RemoveCartEvent>(
      (event, emit) => emit(CartSuccessState(products: _productsRepo.removeProduct(event.product))),
    );
  }
}