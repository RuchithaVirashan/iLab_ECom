import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ilabecom/model/product_list_model.dart';

import '../bloc/cart/cart_bloc.dart';
import '../components/cart/cart_item_card.dart';
import '../components/cart/order_summary.dart';
import '../components/common/back_app_bar.dart';
import '../components/common/button.dart';
import '../components/common/default_text.dart';
import '../components/common/header_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartBloc cartBloc;
  List<ProductItem> cartItems = [];

  @override
  void initState() {
    super.initState();
    cartBloc = BlocProvider.of<CartBloc>(context);
    cartBloc.add(FetchCartList(context));
    cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        cartItems = state.cartList;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: const BackAppBar(
        statename: 'Cart',
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return CartItemCard(
                    index: index,
                    cartItems: cartItems,
                  );
                },
              ),
            ),
            SizedBox(height: 8.h),
            OrderSummaryDet(cartItems: cartItems),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70.h,
        child: BottomAppBar(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ButtonWidget(
              onPressed: () {},
              minHeight: 55.h,
              buttonName: 'Checkout',
              tcolor: Colors.white,
              bcolor: const Color(0xFF154478),
              borderColor: Colors.white,
              radius: 15.r,
              fcolor: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
