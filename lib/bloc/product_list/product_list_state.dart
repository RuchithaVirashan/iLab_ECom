part of 'product_list_bloc.dart';

class ProductListState {}

class ProductListInitial extends ProductListState {}

class ItemsLoadedState extends ProductListState {
  final List<ProductItem> items;
  ItemsLoadedState(this.items);
}

class ProductDtailsState extends ProductListState {
  final ProductItem item;
  ProductDtailsState(this.item);
}

class ProductListLoading extends ProductListState {
  final bool isLoading;

  ProductListLoading(this.isLoading);
}
