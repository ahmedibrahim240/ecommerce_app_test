import 'package:ecommerce_app/core/controllers/controllers.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthControllers>(AuthControllers());
    Get.put<RouteController>(RouteController());
    Get.put<BestSellingControllers>(BestSellingControllers());
    Get.put<NavBarController>(NavBarController());
    Get.put<CategoriesControllers>(CategoriesControllers());
    Get.put<RefreshContrllors>(RefreshContrllors());
    Get.put<AccountController>(AccountController());
    Get.put<CheckoutController>(CheckoutController());
    Get.put<AddressController>(AddressController());
    Get.put<SplachController>(SplachController());
    Get.put<OrderController>(OrderController());
    Get.put<CartContllors>(CartContllors());
    Get.put<ProductControllers>(ProductControllers());
    Get.put<AllProductController>(AllProductController());
    Get.put<SearchController>(SearchController());
    Get.put<FavoritesConttroller>(FavoritesConttroller());
  }
}
