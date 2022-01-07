import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/order_history_models.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final OrderHistoryModels order;
  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: accountController.darkMode.value
          ? RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              side: BorderSide(
                color: Colors.grey.withOpacity(.5),
                width: 1,
              ),
            )
          : null,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultSize,
          vertical: defaultSize,
        ),
        child: Column(
          children: [
            _cardTitle("Orders:"),
            // SizedBox(height: defaultSize),
            _buildOrderTitiles(),
            // SizedBox(height: defaultSize),
            _cardTitle("Addrees:"),
            // SizedBox(height: defaultSize),
            CustomText(
              text: order.address ?? '',
              fontSize: 12,
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: defaultSize),
            _cardTitle("Delivery Date:"),
            CustomText(
              text: order.orderDate ?? '',
              fontSize: 12,
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: defaultSize),
          ],
        ),
      ),
    );
  }

  _cardTitle(String title) {
    return CustomText(
      text: title,
      color: kPrimaryColor,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );
  }

  _buildOrderTitiles() {
    return Container(
      height: defaultSize * 2,
      width: screenWidth,
      child: ListView.builder(
        itemCount: order.titles!.length,
        itemBuilder: (context, index) {
          String title = order.titles![index].toString();
          return CustomText(
            text: "$title,",
            fontSize: 12,
          );
        },
      ),
    );
  }
}
