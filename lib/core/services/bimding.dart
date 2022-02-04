import 'package:ecommerce_app/core/controllers/controllers.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthControllers());
    Get.put(RouteController());
    Get.put(BestSellingControllers());
    Get.put(NavBarController());
    Get.put(CategoriesControllers());
    Get.put(RefreshContrllors());
    Get.put(AccountController());
    Get.put(CheckoutController());
    Get.put(AddressController());
    Get.put(SplachController());
    Get.put(OrderController());
    Get.put(CartContllors());
    Get.put(ProductControllers());
    Get.put(AllProductController());
    Get.put(SearchController());
    Get.put(FavoritesConttroller());
  }
}
