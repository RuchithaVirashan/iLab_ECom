// ignore_for_file: use_build_context_synchronously, invalid_use_of_visible_for_testing_member

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilabecom/components/status/sucess.dart';
import 'package:ilabecom/model/product_list_model.dart';
import 'package:ilabecom/screen/main_screen.dart';

import '../../components/status/error.dart';
import '../../model/order_model.dart';
import '../cart/cart_bloc.dart';
// ignore: depend_on_referenced_packages
part 'user_data_event.dart';
part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  List<OrderModel> orders = [];

  UserDataBloc() : super(UserDataInitial()) {
    on<PlaceOrder>((event, emit) async {
      try {
        orders.add(event.orderData);
        showSuccessDialog(event.context,
            'Successfully added order from ${event.orderData.customerName} at ${event.orderData.orderDate}');
        final cartBloc = BlocProvider.of<CartBloc>(event.context);
        cartBloc.add(ClearCart(event.context));
        Navigator.push(
          event.context,
          MaterialPageRoute(
              builder: (context) => const MainScreen(selectedIndex: 0)),
        );
      } catch (e) {
        log("Error: $e");
        showErrorDialog(event.context, e.toString());
      }
    });
  }
}
