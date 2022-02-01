import 'package:get/get.dart';

class NavBarController extends GetxController {
  static NavBarController instance = Get.find();
  var currentIndex = 0.obs;
  var activeIndex = 0.obs;
  setCurretIndex(var index) {
    currentIndex = index;
    activeIndex = index;
    update();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   currentIndex.value = 0;
  //   activeIndex.value = 0;
  // }
}
