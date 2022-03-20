import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/categories_controllers.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/screens/categories_page_item/categories_page_item.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:get/get.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: Get.put<CategoriesControllers>(CategoriesControllers()),
      builder: (CategoriesControllers catController) {
        return Column(
          children: [
            CustomText(
              text: 'Categories',
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 20),
            Container(
              height: 110,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: catController.categoriesmodels.length,
                itemBuilder: (_, index) {
                  return _BuildCategorsItem(
                    categoriesmodels: catController.categoriesmodels[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(width: defaultSize * 2),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _BuildCategorsItem extends StatelessWidget {
  final Categoriesmodels categoriesmodels;

  const _BuildCategorsItem({
    Key? key,
    required this.categoriesmodels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => routeController.routePage(
        type: 'to',
        page: () => CategoriesPageItem(
          categoriesmodels: categoriesmodels,
        ),
      ),
      child: Column(
        children: [
          Hero(
            tag: 'icon${categoriesmodels.icon}',
            child: CircleAvatar(
              radius: defaultSize * 4,
              backgroundColor: Colors.white,
              child: CustomCachedNetworkImage(
                context: context,
                url: categoriesmodels.icon!,
                boxFit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(height: defaultSize),
          Hero(
            tag: 'title${categoriesmodels.name}',
            child: CustomText(
              text: categoriesmodels.name!,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
