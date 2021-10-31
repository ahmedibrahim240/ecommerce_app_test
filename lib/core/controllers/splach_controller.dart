import 'package:get/get.dart';

class SplachController extends GetxController {
  static SplachController instance = Get.find();
  Rx<bool> isStart = false.obs;
  @override
  void onReady() {
    super.onReady();
    isStart.value = true;
  }
}
