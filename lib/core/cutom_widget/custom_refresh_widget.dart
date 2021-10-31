import 'package:ecommerce_app/core/constans/controllers.dart';
import 'package:ecommerce_app/core/constans/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CustomRefreshWidget extends StatelessWidget {
  final Widget child;
  const CustomRefreshWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return RefreshIndicator(
          onRefresh: () async {
            refreshContrllors.onRefresh();
          },
          child: (refreshContrllors.loading.value)
              ? Container(
                  child: Center(
                    child: SpinKitFadingGrid(
                      color: kPrimaryColor.withOpacity(0.7),
                      size: 70,
                      // duration: Duration(milliseconds: 3500),
                    ),
                  ),
                )
              : child,
        );
      },
    );
  }
}
