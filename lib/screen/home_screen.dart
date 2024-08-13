import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ilabecom/bloc/product_list/product_list_bloc.dart';
import 'package:ilabecom/components/home/item_card.dart';
import 'package:ilabecom/model/product_list_model.dart';

import '../components/common/default_text.dart';
import '../components/common/header_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductListBloc productListBloc;

  List<ProductItem> productList = [];

  @override
  void initState() {
    super.initState();
    productListBloc = BlocProvider.of<ProductListBloc>(context);
    productListBloc.add(FetchProductListEvent(context));

    productListBloc.stream.listen((event) {
      if (event is ItemsLoadedState) {
        productList = event.items;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      left: 30.w,
                      right: 30.w,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10.h,
                            left: 10.w,
                            right: 10.w,
                            bottom: 10.w,
                          ),
                          child: HeaderText(
                            colorR: Colors.black,
                            content:
                                'Buy the best quality products at the best prices',
                            fontSizeR: 18.sp,
                            fontWeightR: FontWeight.bold,
                            textAlignR: TextAlign.center,
                            letterSpace: 6.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 1.w,
                    ),
                    child: productList.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: productList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.w,
                              mainAxisSpacing: 10.h,
                              childAspectRatio: 0.75,
                            ),
                            itemBuilder: (context, index) {
                              return ItemCard(
                                prod: productList,
                                onPressed: () {
                                  log('clicked ${productList[index]}');
                                  productListBloc.add(
                                      PassProductDetails(productList[index]));
                                  Navigator.of(context).pushNamed('/details');
                                },
                                index: index,
                              );
                            },
                          ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
