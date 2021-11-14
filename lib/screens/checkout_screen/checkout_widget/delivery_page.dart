import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/checkout_controller.dart';
import 'package:ecommerce_app/core/cutom_widget/custom_text.dart';
import 'package:ecommerce_app/models/delivery_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      builder: (controller) => ListView.separated(
        itemCount: deliveryRidoList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          DeliveryModel model = deliveryRidoList[index];

          return Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.grey.shade400,
            ),
            child: RadioListTile(
              value: model.value,
              groupValue: controller.deliveryGroupValue.value,
              isThreeLine: true,
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: kPrimaryColor,
              dense: false,
              title: CustomText(
                text: model.title,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              subtitle: CustomText(
                text: model.subTitle,
                maxLines: 3,
                fontSize: 12,
              ),
              onChanged: (value) {
                controller.updataDelGroupVale(value);
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: defaultSize * 2),
      ),
    );
  }
}
