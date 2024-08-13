// ignore_for_file: use_build_context_synchronously, invalid_use_of_visible_for_testing_member

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilabecom/components/status/sucess.dart';
import 'package:ilabecom/model/product_list_model.dart';
import 'package:ilabecom/screen/main_screen.dart';

import '../../components/status/error.dart';
// ignore: depend_on_referenced_packages
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<ProductItem> cartList = [];

  CartBloc() : super(CartInitial()) {
    on<AddToCart>((event, emit) async {
      try {
        cartList.add(event.item);
        showSuccessDialog(
            event.context, 'Successfully added ${event.item.name} to cart');
        Navigator.push(
          event.context,
          MaterialPageRoute(
              builder: (context) => const MainScreen(selectedIndex: 1)),
        );
      } catch (e) {
        log("Error: $e");
        showErrorDialog(event.context, e.toString());
      }
    });

    on<FetchCartList>((event, emit) async {
      try {
        emit(CartLoaded(cartList));
      } catch (e) {
        log("Error: $e");
        showErrorDialog(event.context, e.toString());
      }
    });

    on<RemoveFromCart>((event, emit) async {
      try {
        removeItem(event.index, event.context);
      } catch (e) {
        log("Error: $e");
        showErrorDialog(event.context, e.toString());
      }
    });
  }

  Future<void> removeItem(int index, BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Are you sure you want to delete this item?'),
          title: const Text(
            'DELETE',
            style: TextStyle(letterSpacing: 8),
          ),
          titleTextStyle: const TextStyle(
            fontSize: 18,
            color: Color(0xFF781515),
            fontWeight: FontWeight.bold,
          ),
          contentTextStyle: const TextStyle(
            fontSize: 24,
            color: Color(0xFF781515),
            fontWeight: FontWeight.w400,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:
                  const Text('No', style: TextStyle(color: Color(0xFF781515))),
            ),
            TextButton(
              onPressed: () {
                cartList.removeAt(index);
                emit(CartLoaded(cartList));
                Navigator.of(context).pop();
              },
              child: const Text('Delete',
                  style: TextStyle(color: Color(0xFF781515))),
            ),
          ],
        );
      },
    );
  }
}
