import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/best_selling_controllers%20.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/core/services/network_services/network_sensitive.dart';
// import 'package:ecommerce_app/models/product_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProcutScreen extends GetWidget<BestSellingControllers> {
  // final List<Productmodels> productlist;

  const AllProcutScreen({
    Key? key,
    // required this.productlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Best Selling'),
      ),
      body: NetworkSensitive(
        child: AllProductBody(
          productlist: controller.productmodels,
        ),
      ),
    );
  }
}

class AllProductBody extends StatelessWidget {
  final List productlist;
  const AllProductBody({
    Key? key,
    required this.productlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomRefreshWidget(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: productlist.length,
        padding: EdgeInsets.only(top: defaultSize, bottom: defaultSize),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemBuilder: (_, index) {
          return BuildProdectItem(
            product: productlist[index],
            isAll: true,
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: defaultSize * 2),
      ),
    );
  }
}
