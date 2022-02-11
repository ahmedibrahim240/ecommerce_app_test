import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:flutter/material.dart';
import 'checkout_widget/checkout_widget.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        checkoutController.setInitData();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Checkout',
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: defaultSize, vertical: defaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTimeLineCart(),
              SizedBox(height: defaultSize * 5.5),
              Expanded(
                child: TimeLinePages(),
              ),
              NextPageContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
