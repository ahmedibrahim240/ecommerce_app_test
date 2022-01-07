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
  var deliveryRadioListModel = DeliveryModel().obs;
  Rx<AddressModel> userAddress = AddressModel().obs;
  late Rx<String> deliveryDate = ''.obs;
  nextPage() {
    if (pageIndex.value == 2) {
      getOderDEtails();
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

  createUsercheckOutAddress(AddressModel address) {
    userAddress.value = address;
    update();
  }

  getOderDEtails() {
    AddressModel address = checkoutController.userAddress.value;
    orderController.address =
        '${address.country}-${address.state}-${address.city}-${address.street1}-${address.street2}';
    orderController.orrderDate = checkoutController.deliveryDate.value;
    orderController.getOrderID();
    for (var item in cartContllors.cartItemList) {
      orderController.titles.add(item.tilte);
    }

    OrderHistoryModels order = OrderHistoryModels(
      titles: orderController.titles,
      address: orderController.address,
      orderDate: orderController.orrderDate,
      id: orderController.orderID.value,
    );

    pageIndex.value = 0;
    routeController.routePage(
      type: "offAll",
      page: FinishScreen(),
      arguments: order,
    );
  }
}
