import 'package:ecommerce_app/core/services/network_services/network_sensitive.dart';
import 'package:ecommerce_app/screens/authenticate/auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NetworkSensitive(
        child: LogInScreen(),
      ),
    );
  }
}
