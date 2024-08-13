part of 'product_list_bloc.dart';

abstract class ProductListEvent {}

class FetchProductListEvent extends ProductListEvent {
  final BuildContext context;

  FetchProductListEvent(this.context);
}

class PassProductDetails extends ProductListEvent {
  final ProductItem item;
  PassProductDetails(this.item);
}

class FetchProductDetails extends ProductListEvent {}
