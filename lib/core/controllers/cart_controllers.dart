import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/models.dart';

import 'package:ecommerce_app/screens/screens.dart';
import 'package:get/get.dart';

class CartContllors extends GetxController {
  var inCart = false.obs;
  static CartContllors instance = Get.find();
  var cartItemList = [].obs;
  var cartItemmodelsList = [].obs;

  var totalPrice = 0.0.obs;

  String cartCollection = "users_cart";

  Rx<bool> reloadPage = false.obs;
  @override
  void onReady() {
    super.onReady();

    ever(authControllers.usermodels, getCartItemListDate);
  }

  getCartItemListDate(Usermodels user) {
    cartItemList.value = user.cart;

    getTotalPrice(user);
    update();
  }

  addProduct(CartItemmodels product) async {
    try {
      await authControllers.updateUserData(
        {
          'cart': FieldValue.arrayUnion(
            [
              product.toJson(),
            ],
          ),
        },
      );
    } catch (e) {
      customErrorSnakBar(
        error: "Cannot add this item , try again later\n$e",
      );
    }

    update();
  }

  delateProduct({required var product}) async {
    try {
      CartItemmodels item = getCartItemById(product.productId);
      reloadPage.value = true;

      await authControllers.updateUserData(
        {
          DBCARTNAME: FieldValue.arrayRemove(
            [
              item.toJson(),
            ],
          ),
        },
      );

      reloadPage.value = false;

      productControllers.updataInCartProduct(
        inCart: false,
        type: 'id',
        id: product.productId,
      );
    } catch (e) {
      customErrorSnakBar(
        error: "Cannot remove this item , try again later\n$e",
      );
    }
    update();
  }

  delateAllPrdect() {
    try {
      authControllers.updateUserData(
        {
          DBCARTNAME: [],
        },
      );
      productControllers.updataInCartProduct(
        inCart: false,
        type: 'all',
        // id: product.id,
      );
    } catch (e) {
      customErrorSnakBar(
        error: "Cannot remve cart item , try again later\n$e",
      );
    }
    update();
  }

  getTotalPrice(Usermodels user) {
    if (user.cart.isEmpty) {
      totalPrice.value = 0.0;
    } else {
      totalPrice.value = 0.0;

      user.cart.forEach(
        (element) {
          totalPrice.value += (element.price * element.quantity);
        },
      );
    }
  }

  CartItemmodels getCartItemById(String id) {
    return authControllers.usermodels.value.cart!
        .where((item) => (item.productId == id))
        .last;
  }

  bool isINCartInitial(Productmodels product) {
    if (authControllers.usermodels.value.cart == null) {
      return false;
    } else {
      return authControllers.usermodels.value.cart
          .where(
            (item) => item.productId == product.productId,
          )
          .isNotEmpty;
    }
  }

  increaseQuantity(int index) {
    cartItemList[index].quantity++;

    Usermodels user = authControllers.usermodels.value;
    user.cart = cartItemList;

    authControllers.updateUserData(
      {
        DBCARTNAME: user.cartItemsToJson(),
      },
    );
    update();
  }

  decreaseQuantity({
    required CartItemmodels item,
    required int index,
  }) async {
    if (item.quantity == 1) {
      delateProduct(product: item);
    } else {
      cartItemList[index].quantity--;
      Usermodels user = authControllers.usermodels.value;
      user.cart = cartItemList;

      authControllers.updateUserData(
        {
          DBCARTNAME: user.cartItemsToJson(),
        },
      );
    }
    update();
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
}
