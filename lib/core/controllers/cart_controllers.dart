import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/cart_product_models.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:get/get.dart';

class CartContllors extends GetxController {
  var inCart = false.obs;
  static CartContllors instance = Get.find();
  var cartItemList = [].obs;
  var totalPrice = 0.0.obs;
  @override
  void onReady() {
    super.onReady();
    getAllProduct();
  }

  addProduct(CartProductMoldes cartProductMoldes) async {
    await dbHelper.insertProduct(cartProductMoldes);
    isInCart(cartProductMoldes.productId!);
    getAllProduct();
  }

  cartRoutePage() async {
    if (cartItemList.isEmpty) {
      routeController.routePage(
        type: 'offAll',
        page: CustonNavBar(),
        arguments: 0.obs,
      );
    } else {
      routeController.routePage(
        type: 'to',
        page: CheckOutScreen(),
      );
    }
  }

  getAllProduct() async {
    List<Map> map = await dbHelper.allProduct();
    cartItemList.value = map
        .map(
          (e) => CartProductMoldes.formMap(e),
        )
        .toList();

    if (cartItemList.isNotEmpty) {
      totalPrice.value = 0.0;
      for (int i = 0; i < cartItemList.length; i++) {
        totalPrice.value +=
            (cartItemList[i].price! * cartItemList[i].quantity!);
      }
    } else {
      totalPrice.value = 0.0;
      bestSellingControllers.updataProduct(inCart: false, type: "all");
    }
    update();
  }

  delateAllPrdect() async {
    cartItemList.value = [];
    totalPrice.value = 0.0;
    await dbHelper.deleteAllProduct();
  }

  isInCart(String id) async {
    CartProductMoldes? product = await dbHelper.getProductById(id);
    if (product == null) {
      inCart.value = true;
      update();

      return true;
    } else {
      inCart.value = false;
      update();

      return false;
    }
  }

  delateProduct(String id) async {
    CartProductMoldes? product = await dbHelper.getProductById(id);

    await dbHelper.deleteProduct(product!.id);
    isInCart(id);
    getAllProduct();
    update();
  }

  increaseQuantity(int index) async {
    cartItemList[index].quantity++;
    await dbHelper.updateProduct(cartItemList[index]);
    getAllProduct();
    update();
  }

  decreaseQuantity(int index) async {
    cartItemList[index].quantity--;
    await dbHelper.updateProduct(cartItemList[index]);
    getAllProduct();
    update();
  }
}
