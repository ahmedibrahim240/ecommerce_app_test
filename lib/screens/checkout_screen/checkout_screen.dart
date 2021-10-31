import 'package:flutter/material.dart';
import 'checkout_widget/checkout_widget.dart';
import 'checkout_widget/time_line_pages.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Checkout',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTimeLineCart(),
            SizedBox(height: 50),
            Expanded(
              child: TimeLinePages(),
            ),
            NextPageContainer(),
          ],
        ),
      ),
    );
  }
}
