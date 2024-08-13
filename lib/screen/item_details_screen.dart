import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ilabecom/components/common/default_text.dart';
import 'package:ilabecom/model/product_list_model.dart';

import '../bloc/cart/cart_bloc.dart';
import '../bloc/product_list/product_list_bloc.dart';
import '../components/common/back_app_bar.dart';
import '../components/common/button.dart';

class ItemDetailsSceen extends StatefulWidget {
  const ItemDetailsSceen({super.key});

  @override
  State<ItemDetailsSceen> createState() => _ItemDetailsSceenState();
}

class _ItemDetailsSceenState extends State<ItemDetailsSceen> {
  late ProductListBloc productListBloc;

  ProductItem? productItem;

  @override
  void initState() {
    super.initState();
    productListBloc = BlocProvider.of<ProductListBloc>(context);
    productListBloc.add(FetchProductDetails());
    productListBloc.stream.listen((event) {
      if (event is ProductDtailsState) {
        productItem = event.item;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: const BackAppBar(
        statename: 'Product Details',
      ),
      body: productItem == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.network(
                        productItem!.image,
                        height: 300.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png",
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  DefaultText(
                    content: productItem!.name,
                    fontSizeR: 24.sp,
                    fontWeightR: FontWeight.bold,
                    textAlignR: TextAlign.left,
                    colorR: Colors.black,
                  ),
                  SizedBox(height: 8.h),
                  DefaultText(
                    content: '\$${productItem!.price.toStringAsFixed(2)}',
                    fontSizeR: 20.sp,
                    fontWeightR: FontWeight.w500,
                    textAlignR: TextAlign.left,
                    colorR: Colors.black,
                  ),
                ],
              ),
            ),
      bottomNavigationBar: SizedBox(
        height: 70.h,
        child: BottomAppBar(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ButtonWidget(
              onPressed: () async {
                final cartBloc = BlocProvider.of<CartBloc>(context);
                cartBloc.add(AddToCart(productItem!, context));
              },
              minHeight: 55.h,
              buttonName: 'Add to Cart',
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
