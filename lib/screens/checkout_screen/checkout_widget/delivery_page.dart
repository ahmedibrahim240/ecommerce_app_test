import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/checkout_controller.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/delivery_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // late DeliveryModel model;
    return GetBuilder<CheckoutController>(
      builder: (controller) => Column(
        children: [
          _buildRadioListTile(controller),
          if (controller.deliveryRadioListModel.value.value == 3)
            CustomButtom(
              onPreessed: () => _showDatePicker(context, controller),
              child: CustomText(
                text: 'Select Date',
                alignment: Alignment.center,
                color: Colors.white,
              ),
              bgColor: kPrimaryColor,
            )
        ],
      ),
    );
  }

  _buildRadioListTile(CheckoutController controller) {
    return ListView.separated(
      itemCount: deliveryRidoList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        controller.deliveryRadioListModel.value = deliveryRidoList[index];

        return Theme(
          data: ThemeData(
            unselectedWidgetColor: Colors.grey.shade400,
          ),
          child: RadioListTile(
            value: controller.deliveryRadioListModel.value.value!,
            groupValue: controller.deliveryGroupValue.value,
            isThreeLine: true,
            controlAffinity: ListTileControlAffinity.trailing,
            activeColor: kPrimaryColor,
            dense: false,
            title: CustomText(
              text: controller.deliveryRadioListModel.value.title!,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            subtitle: CustomText(
              text: controller.deliveryRadioListModel.value.subTitle!,
              maxLines: 3,
              fontSize: 12,
            ),
            onChanged: (int? value) {
              controller.deliveryRadioListModel.value =
                  deliveryRidoList[value! - 1];
              controller.updataDelGroupVale(value);
              if (value == 1) {
                var date = DateTime.now().add(
                  Duration(days: 3),
                );
                var date2 = DateTime.now().add(
                  Duration(days: 5),
                );
                controller.deliveryDate.value =
                    'we will send order between: ${date.year}-${date.month}-${date.day}/${date2.year}-${date2.month}-${date2.day}';
                print('deliveryDate${controller.deliveryDate.value}');
              } else if (value == 2) {
                var date = DateTime.now().add(
                  Duration(days: 1),
                );
                controller.deliveryDate.value =
                    '${date.year}-${date.month}-${date.day}';
                print('deliveryDate${controller.deliveryDate.value}');
              } else {
                _showDatePicker(
                  context,
                  controller,
                );
              }
            },
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: defaultSize * 2),
    );
  }

  _showDatePicker(
    BuildContext context,
    CheckoutController controller,
  ) async {
    var disable = await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      theme: accountController.darkMode.value ? AppTheme.datePickerTheme : null,
      currentTime: DateTime.now().add(
        Duration(days: 1),
      ),
      minTime: DateTime.now().add(
        Duration(days: 1),
      ),
      onConfirm: (date) {
        controller.deliveryDate.value =
            '${date.year}-${date.month}-${date.day}';
      },
      onCancel: () {
        controller.deliveryDate.value = '';
        customErrorSnakBar(
          error: 'Choose Delivery Date first',
        );
      },
    );
    if (disable == null) {
      controller.deliveryDate.value = '';
      customErrorSnakBar(
        error: 'Choose Delivery Date first',
      );
    }
  }
}
