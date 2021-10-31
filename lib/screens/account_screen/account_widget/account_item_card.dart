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

  final AccountModels data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      builder: (controller) => Container(
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: (data.icon == null)
                        ? const EdgeInsets.fromLTRB(5, 5, 8, 10)
                        : const EdgeInsets.all(8),
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
                  SizedBox(width: 20),
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
                onChanged: (value) async {
                  controller.darkMode.value = value;
                  if (controller.isSystemMode.value) {
                    controller.isSystemMode.value = false;
                    await MySharedPreferences.saveisSystemMode(value);
                  }

                  controller.switchDartMode();
                  await MySharedPreferences.saveisDartMode(value);
                },
              ),
            if (index == accountList.length - 2)
              Switch(
                value: accountController.isSystemMode.value,
                activeColor: kPrimaryColor,
                onChanged: (value) async {
                  controller.isSystemMode.value = value;
                  controller.getThemeMode();
                  await MySharedPreferences.saveisSystemMode(value);
                },
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
                  size: 20,
                ),
              ),
            SizedBox(
              width: (index == accountList.length - 2) ||
                      (index == accountList.length - 3)
                  ? 5
                  : 20,
            ),
          ],
        ),
      ),
    );
  }

  buidIcons({String? icon, required int index}) {
    if (icon == null) {
      if ((index == accountList.length - 3)) {
        return Icon(
          (accountController.darkMode.value)
              ? CupertinoIcons.brightness_solid
              : CupertinoIcons.moon_stars,
          color:
              accountController.darkMode.value ? kPrimaryColor : Colors.black,
          size: 30,
        );
      } else {
        return Icon(
          Icons.color_lens,
          color:
              accountController.darkMode.value ? kPrimaryColor : Colors.black,
          size: 30,
        );
      }
    } else {
      return Center(
        child: Image.asset(icon),
      );
    }
  }
}
