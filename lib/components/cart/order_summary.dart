import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/product_list_model.dart';
import '../common/default_text.dart';

class OrderSummaryDet extends StatelessWidget {
  final List<ProductItem> cartItems;
  const OrderSummaryDet({super.key, required this.cartItems});

  double getTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + item.price);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultText(
                content: 'Order Summary',
                fontSizeR: 22.sp,
                fontWeightR: FontWeight.bold,
                colorR: Colors.black,
                textAlignR: TextAlign.start),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultText(
                    content: 'Total Items: ',
                    fontSizeR: 18.sp,
                    fontWeightR: FontWeight.w500,
                    colorR: Colors.black,
                    textAlignR: TextAlign.start),
                DefaultText(
                    content: '${cartItems.length}',
                    fontSizeR: 18.sp,
                    fontWeightR: FontWeight.w500,
                    colorR: Colors.black,
                    textAlignR: TextAlign.start),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultText(
                  content: 'Total Price: ',
                  fontSizeR: 18.sp,
                  fontWeightR: FontWeight.w500,
                  colorR: Colors.black,
                  textAlignR: TextAlign.start,
                ),
                DefaultText(
                    content: '\$${getTotalPrice().toStringAsFixed(2)}',
                    fontSizeR: 18.sp,
                    fontWeightR: FontWeight.w500,
                    colorR: Colors.black,
                    textAlignR: TextAlign.start),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultText(
                    content: 'Total Payment: ',
                    fontSizeR: 18.sp,
                    fontWeightR: FontWeight.w500,
                    colorR: Colors.black,
                    textAlignR: TextAlign.start),
                DefaultText(
                    content: '\$${getTotalPrice().toStringAsFixed(2)}',
                    fontSizeR: 18.sp,
                    fontWeightR: FontWeight.w500,
                    colorR: Colors.black,
                    textAlignR: TextAlign.start),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
