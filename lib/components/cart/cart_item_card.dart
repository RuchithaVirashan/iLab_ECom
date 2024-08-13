import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/cart/cart_bloc.dart';
import '../../model/product_list_model.dart';
import '../common/default_text.dart';

class CartItemCard extends StatelessWidget {
  final int index;
  final List<ProductItem> cartItems;
  const CartItemCard({
    super.key,
    required this.index,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              cartItems[index].image,
              height: 80.h,
              width: 80.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png",
                  height: 80.h,
                  width: 80.h,
                );
              },
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  content: cartItems[index].name,
                  fontSizeR: 20.sp,
                  fontWeightR: FontWeight.bold,
                  colorR: Colors.black,
                  textAlignR: TextAlign.start,
                ),
                SizedBox(height: 8.h),
                DefaultText(
                  content: '\$${cartItems[index].price.toStringAsFixed(2)}',
                  fontSizeR: 18.sp,
                  fontWeightR: FontWeight.w500,
                  colorR: Colors.black,
                  textAlignR: TextAlign.start,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              final cartBloc = BlocProvider.of<CartBloc>(context);
              cartBloc.add(RemoveFromCart(index, context));
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
              size: 24.sp,
            ),
          ),
        ],
      ),
    );
  }
}
