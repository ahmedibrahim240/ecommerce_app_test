import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtom extends StatelessWidget {
  final Widget child;
  final Function onPreessed;

  final Color? bgColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? margin;
  final double borderWidth;
  final double borderRdius;

  const CustomButtom({
    Key? key,
    required this.child,
    required this.onPreessed,
    this.bgColor,
    this.borderColor = Colors.transparent,
    this.margin,
    this.borderWidth = 1.0,
    this.borderRdius = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      builder: (controller) => InkWell(
        onTap: () => onPreessed(),
        child: Card(
          elevation: 0.0,
          color: (bgColor == null)
              ? (!controller.darkMode.value)
                  ? Colors.white
                  : Colors.black12
              : bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRdius),
            ),
            side: BorderSide(
              color: borderColor!,
              width: borderWidth,
            ),
          ),
          child: Container(
            margin: margin ??
                EdgeInsets.symmetric(
                  vertical: defaultSize * 2,
                  horizontal: defaultSize * 2,
                ),
            child: child,
          ),
        ),
      ),
    );
  }
}
