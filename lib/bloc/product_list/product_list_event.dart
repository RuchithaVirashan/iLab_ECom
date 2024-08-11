part of 'product_list_bloc.dart';

abstract class ProductListEvent {}

class FetchProductListEvent extends ProductListEvent {}

class PassProductDetails extends ProductListEvent {
  final ProductItem item;
  PassProductDetails(this.item);
}

class FetchProductDetails extends ProductListEvent {}
