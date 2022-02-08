import 'dart:math' as math;
import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/account_controller.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountItemCard extends GetWidget {
  const AccountItemCard({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final Accountmodels data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => accountController.routePages(index),
      child: GetBuilder<AccountController>(
        builder: (controller) => Container(
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: defaultSize * 5,
                      width: defaultSize * 5,
                      padding: (data.icon == null)
                          ? EdgeInsets.fromLTRB(defaultSize / 2,
                              defaultSize / 2, defaultSize - 2, defaultSize)
                          : EdgeInsets.all(defaultSize - 2),
                      decoration: BoxDecoration(
                        color: controller.darkMode.value
                            ? Colors.grey.shade200
                            : Color(0xff00C569).withOpacity(0.1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: buidIcons(
                        index: index,
                        icon: data.icon,
                      ),
                    ),
                    SizedBox(width: defaultSize * 2),
                    (index == accountList.length - 3) &&
                            (controller.darkMode.value)
                        ? CustomText(
                            text: 'Light',
                            fontSize: 15,
                          )
                        : CustomText(
                            text: data.title,
                            fontSize: 15,
                          ),
                  ],
                ),
              ),
              if (index == accountList.length - 3)
                Switch(
                  value: accountController.darkMode.value,
                  activeColor: kPrimaryColor,
                  onChanged: (value) => controller.onChangedDarKMode(value),
                ),
              if (index == accountList.length - 2)
                Switch(
                  value: accountController.isSystemMode.value,
                  activeColor: kPrimaryColor,
                  onChanged: (value) => controller.onChangedSystemMode(value),
                ),
              if ((index != accountList.length - 1) &&
                  (index != accountList.length - 2) &&
                  (index != accountList.length - 3))
                Transform.rotate(
                  angle: 180 * math.pi / 180,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color:
                        controller.darkMode.value ? Colors.white : Colors.black,
                    size: defaultSize * 2,
                  ),
                ),
              SizedBox(
                width: (index == accountList.length - 2) ||
                        (index == accountList.length - 3)
                    ? defaultSize / 2
                    : defaultSize * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buidIcons({String? icon, required int index}) {
    if (icon == null) {
      if ((index == accountList.length - 4)) {
        return Icon(
          Icons.favorite,
          color: Colors.red,
          size: defaultSize * 4,
        );
      }
      if ((index == accountList.length - 3)) {
        return Icon(
          (accountController.darkMode.value)
              ? CupertinoIcons.brightness_solid
              : CupertinoIcons.moon_stars,
          color:
              accountController.darkMode.value ? kPrimaryColor : Colors.black,
          size: defaultSize * 4,
        );
      } else {
        return Icon(
          Icons.color_lens,
          color:
              accountController.darkMode.value ? kPrimaryColor : Colors.black,
          size: defaultSize * 4,
        );
      }
    } else {
      return Center(
        child: Image.asset(icon),
      );
    }
  }
}
