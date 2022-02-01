import 'package:ecommerce_app/core/services/network_services/network_sensitive.dart';
import 'package:flutter/material.dart';

import '../account_widget.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NetworkSensitive(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order History'),
        ),
        body: OrderHistoryBody(),
      ),
    );
  }
}
