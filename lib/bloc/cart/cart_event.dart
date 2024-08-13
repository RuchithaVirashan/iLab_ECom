part of 'cart_bloc.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final ProductItem item;
  final BuildContext context;

  AddToCart(this.item, this.context);
}

class FetchCartList extends CartEvent {
  final BuildContext context;

  FetchCartList(this.context);
}

class RemoveFromCart extends CartEvent {
  final int index;
  final BuildContext context;

  RemoveFromCart(this.index, this.context);
}
