import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/core/services/network_services/network_sensitive.dart';

import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustonNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _body = [
      NetworkSensitive(
        child: CustomRefreshWidget(
          child: WillPopScope(
            onWillPop: () async {
              if (searchController.isSearch.value) {
                searchController.searchState();

                return false;
              } else {
                return true;
              }
            },
            child: HomeScreen(),
          ),
        ),
      ),
      NetworkSensitive(
        child: CustomRefreshWidget(
          child: CartScreen(),
        ),
      ),
      NetworkSensitive(
        child: CustomRefreshWidget(
          child: AccountScreen(),
        ),
      ),
    ];
    if (Get.arguments != null) {
      navBarController.setCurretIndex(Get.arguments);
    }

    return Scaffold(
      body: Obx(() => _body[navBarController.currentIndex.value]),
      bottomNavigationBar: NetworkSensitive(
        isNavBar: true,
        child: Obx(
          () => BottomNavigationBar(
            elevation: 0.0,
            currentIndex: navBarController.currentIndex.value,
            backgroundColor: accountController.darkMode.value
                ? Colors.black
                : Colors.grey.shade50,
            onTap: (index) {
              navBarController.currentIndex.value = index;
              navBarController.activeIndex.value = index;
            },
            items: navBarItemList
                .map(
                  (item) => BottomNavigationBarItem(
                    activeIcon: _activeIcon(
                      item,
                      navBarController.currentIndex.value,
                      navBarController.activeIndex.value,
                    ),
                    icon: Image.asset(
                      item.icon,
                      fit: BoxFit.contain,
                      width: defaultSize * 2.5,
                      color: (accountController.darkMode.value)
                          ? kPrimaryColor
                          : null,
                    ),
                    label: '',
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  _activeIcon(var item, int index1, int index2) {
    if (index1 == index2) {
      return Padding(
        padding: EdgeInsets.only(top: defaultSize),
        child: Column(
          children: [
            CustomText(
              text: item.title,
              fontSize: 14,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              alignment: Alignment.center,
            ),
            CustomText(
              text: '.',
              color: kPrimaryColor,
              alignment: Alignment.center,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ],
        ),
      );
    } else {
      return null;
    }
  }
}
