import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/account_controller.dart';
import 'package:ecommerce_app/core/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchTextForm extends GetWidget<AccountController> {
  const CustomSearchTextForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return AnimatedContainer(
          duration: Duration(milliseconds: 400),
          width: !searchController.isSearch.value ? 56 : screenWidth,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
            boxShadow: kElevationToShadow[6],
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: searchController.isSearch.value
                      ? TextFormField(
                          // controller: searchController.searshText,
                          onChanged: (text) =>
                              searchController.searchByName(text),
                          onEditingComplete: () {
                            if (searchController.isNoData.value) {
                              searchController.searchState();
                              return;
                            } else if (searchController.searchList.isEmpty) {
                              searchController.searchState();
                              return;
                            } else {
                              FocusScope.of(context).unfocus();

                              return;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Search..',
                            hintStyle: TextStyle(
                              color: Colors.greenAccent.shade400,
                            ),
                            border: InputBorder.none,
                          ),
                        )
                      : null,
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () => searchController.searchState(),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          !searchController.isSearch.value ? 32 : 0),
                      topRight: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                      bottomLeft: Radius.circular(
                          !searchController.isSearch.value ? 32 : 0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        (!searchController.isSearch.value)
                            ? Icons.search
                            : Icons.close,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
