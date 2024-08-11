import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilabecom/model/product_list_model.dart';

import '../../utils/constants.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductItem productItem = ProductItem(
    id: 0,
    name: '',
    price: 0,
    image: '',
  );

  ProductListBloc() : super(ProductListInitial()) {
    on<FetchProductListEvent>((event, emit) async {
      try {
        Response response;

        String apiUrl = '${Constants.baseurl}product';

        response = await Dio().get(
          apiUrl,
        );
        if (response.statusCode == 200) {
          List<ProductItem> items = [];
          for (var item in response.data) {
            items.add(ProductItem.fromJson(item));
          }

          emit(ItemsLoadedState(items));
        } else {
          log("Error: ${response.statusCode}");
        }
      } catch (e) {
        log("Error: $e");
      }
    });

    on<PassProductDetails>((event, emit) {
      productItem = event.item;
      emit(ProductDtailsState(event.item));
    });

    on<FetchProductDetails>((event, emit) {
      emit(ProductDtailsState(productItem));
    });
  }
}
