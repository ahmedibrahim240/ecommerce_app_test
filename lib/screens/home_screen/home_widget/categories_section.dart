import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:get/get.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
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
                itemCount: categoriesControllers.categoriesModels.length,
                itemBuilder: (_, index) {
                  return _BuildCategorsItem(
                    categoriesModels:
                        categoriesControllers.categoriesModels[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 20),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _BuildCategorsItem extends StatelessWidget {
  final CategoriesModels categoriesModels;
  const _BuildCategorsItem({
    Key? key,
    required this.categoriesModels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(categoriesModels.name);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: CustomCachedNetworkImage(
              context: context,
              url: categoriesModels.icon!,
              boxFit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 10),
          CustomText(
            text: categoriesModels.name!,
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
