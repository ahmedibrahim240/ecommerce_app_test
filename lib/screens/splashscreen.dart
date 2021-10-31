import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/services/network_services/network_sensitive.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NetworkSensitive(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: LottieBuilder.asset(
              deliveryIcon2,
            ),
          ),
        ),
      ),
    );
  }
}
