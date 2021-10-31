import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/account_controller.dart';
import 'package:ecommerce_app/core/controllers/checkout_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';

final List<String> _pagesTitle = [
  'Delivery',
  'Address',
  'Summer',
];

class CustomTimeLineCart extends GetWidget<AccountController> {
  const CustomTimeLineCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      builder: (controller) => Container(
        height: 100,
        child: Timeline.tileBuilder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          dragStartBehavior: DragStartBehavior.start,
          builder: TimelineTileBuilder.connected(
            itemExtent: MediaQuery.of(context).size.width / _pagesTitle.length,
            connectionDirection: ConnectionDirection.after,
            connectorBuilder: _connectorBuilder,
            indicatorBuilder: _indicatorBuilder,
            itemCount: _pagesTitle.length,
            contentsAlign: ContentsAlign.basic,
            contentsBuilder: _contentsBuilder,
          ),
        ),
      ),
    );
  }

  Widget _contentsBuilder(context, index) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Text(
        _pagesTitle[index],
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: _getColor(index),
        ),
      ),
    );
  }

  Widget _indicatorBuilder(_, index) {
    if (index <= checkoutController.pageIndex.value) {
      return DotIndicator(
        size: 35.0,
        border: Border.all(color: Colors.green, width: 1),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
        ),
      );
    } else {
      return OutlinedDotIndicator(
        size: 30,
        borderWidth: 1.0,
        color: todoColor,
      );
    }
  }

  Widget _connectorBuilder(_, index, type) {
    if (checkoutController.pageIndex.value == 0) {
      return SolidLineConnector(
        color: todoColor,
      );
    } else {
      if (checkoutController.pageIndex.value == 1) {
        if (index == 0) {
          return SolidLineConnector(
            color: _getColor(checkoutController.pageIndex.value - 1),
          );
        } else {
          return SolidLineConnector(
            color: todoColor,
          );
        }
      } else {
        return SolidLineConnector(
          color: _getColor(index - 1),
        );
      }
    }
  }

  _getColor(int index) {
    if (index == checkoutController.pageIndex.value) {
      return controller.darkMode.value ? Colors.white : inProgressColor;
    } else if (index < checkoutController.pageIndex.value) {
      return Colors.green;
    } else {
      return controller.darkMode.value
          ? Colors.grey.withOpacity(.5)
          : todoColor;
    }
  }
}
