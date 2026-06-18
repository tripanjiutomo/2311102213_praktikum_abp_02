import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/product.dart';

// --- STATE ---
class CartState extends Equatable {
  final List<Product> items;

  const CartState({this.items = const []});

  @override
  List<Object> get props => [items];
}

// --- CUBIT ---
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void addToCart(Product product) {
    final updatedCart = List<Product>.from(state.items)..add(product);
    emit(CartState(items: updatedCart));
  }

  void removeFromCart(Product product) {
    final updatedCart = List<Product>.from(state.items);
    updatedCart.remove(product);
    emit(CartState(items: updatedCart));
  }
}