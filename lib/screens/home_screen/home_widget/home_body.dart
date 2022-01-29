import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_widget.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(
          defaultSize * 2,
          defaultSize * 2,
          defaultSize * 2,
          0.0,
        ),
        child: SingleChildScrollView(
          child: Obx(
            () => GestureDetector(
              onTap: () {
                if ((searchController.isHomeBody.value) &&
                    (searchController.isSearch.value)) {
                  searchController.searchState();
                } else if (searchController.searchList.isNotEmpty) {
                  FocusScope.of(context).unfocus();
                }
              },
              child: Column(
                children: [
                  _noteTest(),
                  SizedBox(height: defaultSize * 1.5),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CustomSearchTextForm(),
                  ),
                  SizedBox(height: defaultSize * 3),
                  if (searchController.searchList.isNotEmpty) SearchBody(),
                  if (searchController.isHomeBody.value) ...[
                    CategoriesSection(),
                    SizedBox(height: defaultSize * 3),
                    BestSellingSections(),
                  ],
                  if (searchController.isNoData.value)
                    GestureDetector(
                      onTap: () {
                        searchController.searchState();

                        FocusScope.of(context).unfocus();
                      },
                      child: NODataYet(),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _noteTest() {
    return CustomText(
      text: 'Note => This app for test and learn GETX.....',
      fontSize: 10,
      color: Colors.grey.shade500,
    );
  }
}
