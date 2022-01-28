import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../screens.dart';
import 'home_widget.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(
          defaultSize * 2,
          defaultSize * 2,
          defaultSize * 2,
          0.0,
        ),
        child: SingleChildScrollView(
          child: Obx(
            () => (searchController.isSearch.value)
                ? Column(
                    children: [
                      _noteTest(),
                      SizedBox(height: defaultSize * 1.5),
                      CustomSearchTextForm(),
                      SizedBox(height: defaultSize * 3),
                      SearchBody(),
                    ],
                  )
                : Column(
                    children: [
                      _noteTest(),
                      SizedBox(height: defaultSize * 1.5),
                      CustomSearchTextForm(),
                      SizedBox(height: defaultSize * 3),
                      CategoriesSection(),
                      SizedBox(height: defaultSize * 3),
                      BestSellingSections(),
                    ],
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

class SearchBody extends StatefulWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        searchController.isSearch.value = false;
        return false;
      },
      child: Obx(
        () {
          if ((searchController.isSearch.value) &&
              searchController.searchList.isEmpty) {
            return Center(
              child: (searchController.reSearch.value)
                  ? CircularProgressIndicator()
                  : NODataYet(),
            );
          } else {
            return (searchController.reSearch.value)
                ? CircularProgressIndicator()
                : AllProductBody(
                    productlist: searchController.searchList,
                  );
          }
        },
      ),
    );
  }
}
