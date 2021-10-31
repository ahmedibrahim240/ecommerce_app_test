import 'package:ecommerce_app/core/controllers/controllers.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthControllers());
    Get.lazyPut(() => NavBarController());
    Get.lazyPut(() => CategoriesControllers());
    Get.lazyPut(() => RefreshContrllors());
    Get.lazyPut(() => BestSellingControllers());
    Get.lazyPut(() => CartContllors());
  }
}
