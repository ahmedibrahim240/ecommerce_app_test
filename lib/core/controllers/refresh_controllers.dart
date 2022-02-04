import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:get/get.dart';

class RefreshContrllors extends GetxController {
  static RefreshContrllors instance = Get.find();
  var loading = false.obs;
  void onRefresh() async {
    loading.value = !loading.value;
    await favoritesConttroller.getAllFavoriteItmesDate(
      favoritesConttroller.getfavouriteList,
    );
    await Future.delayed(
      Duration(seconds: 2),
      () async {
        loading.value = !loading.value;
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
  }
}
