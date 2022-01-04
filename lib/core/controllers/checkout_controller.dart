import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/models/models.dart';
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
      routeController.routePage(type: "to", page: FinishScreen());
      pageIndex.value = 0;
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
}
