import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  static SearchController instance = Get.find();
  Rx<bool> isSearch = false.obs;
  Rx<bool> reSearch = false.obs;

  var searchList = [].obs;
  searchState() {
    isSearch.value = !isSearch.value;
    searchList.value = [];
    update();
  }

  searchByName(String? text) {
    if (text == null) {
      searchList.value = [];
      reSearch.value = false;
    } else if (text.isEmpty) {
      searchList.value = [];
      reSearch.value = true;
    } else {
      searchList.value = [];
      reSearch.value = true;
      allProductController.allProductList.forEach(
        (product) {
          if (product.title.toString().toLowerCase().contains(
                text.toLowerCase(),
              )) {
            searchList.add(product);
          }
        },
      );
    }

    reSearch.value = false;
  }
}
