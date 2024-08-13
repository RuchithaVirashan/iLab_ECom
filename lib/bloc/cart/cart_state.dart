part of 'cart_bloc.dart';

class CartState {}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final List<ProductItem> cartList;
  CartLoaded(this.cartList);
}
