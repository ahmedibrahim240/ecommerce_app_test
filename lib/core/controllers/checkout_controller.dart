import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/models/order_history_models.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController instance = Get.find();
  var pageIndex = 0.obs;
  var deliveryGroupValue = 0.obs;
  var addressGroupValue = 0.obs;
  var deliveryRadioListmodels = Deliverymodels().obs;
  late Rx<String> deliveryDate = ''.obs;
  setInitData() {
    pageIndex.value = 0;
    deliveryGroupValue.value = 0;
    addressGroupValue.value = 0;
    deliveryDate.value = '';
    update();
  }

  nextPage() {
    if (pageIndex.value == 2) {
      getOderDetails();
      return;
    } else {
      pageIndex.value++;
    }
    update();
  }

  updataDelGroupVale(var vale) {
    deliveryGroupValue.value = vale;
    update();
  }

  updataAddressVale(var vale) {
    addressGroupValue.value = vale;
    update();
  }

  backPage() {
    pageIndex.value--;
    update();
  }

  getOderDetails() {
    OrderHistorymodels order = OrderHistorymodels(
      titles: OrderHistorymodels.getOrderTitleList(),
      address: addressController.shippingAddress.value,
      orderDate: checkoutController.deliveryDate.value,
      dateCreated: Timestamp.now(),
    );

    pageIndex.value = 0;
    routeController.routePage(
      type: "offAll",
      page: FinishScreen(),
      arguments: order,
    );
  }
}
