import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/core/services/coustm_dialogs.dart';
import 'package:ecommerce_app/models/order_history_models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  Rx<List<OrderHistorymodels>> orderList = Rx<List<OrderHistorymodels>>([]);
  List<OrderHistorymodels> get getOrderList => orderList.value;
  String ordersCollection = "users_orders";

  var newOrder;

  @override
  void onReady() {
    super.onReady();
    ever(authControllers.firebaseUser!, _setOrderDate);
  }

  _setOrderDate(User? user) {
    if (user == null) {
      debugPrint('wating user login in....');
    } else {
      orderList.bindStream(orderStream(user.uid));
    }
  }

  Stream<List<OrderHistorymodels>> orderStream(String uid) {
    return firebaseFirestore
        .collection("users")
        .doc(uid)
        .collection(ordersCollection)
        .orderBy(OrderHistorymodels.DATECREATED, descending: true)
        .snapshots()
        .map(
      (QuerySnapshot query) {
        List<OrderHistorymodels> retVal = [];
        query.docs.forEach(
          (order) {
            retVal.add(OrderHistorymodels.fromjson(order));
          },
        );
        return retVal;
      },
    );
  }

  createOders(OrderHistorymodels order) async {
    try {
      showLoading();
      String userId = authControllers.usermodels.value.id!;
      await firebaseFirestore
          .collection("users")
          .doc(userId)
          .collection(ordersCollection)
          .add(
            order.tojson(),
          );

      cartContllors.delateAllPrdect();
      productControllers.updataInCartProduct(inCart: false, type: "all");

      updateCheckOutParameter();
      dismissLoadingWidget();
      routeController.routePage(
        type: 'offAll',
        page: () => CustonNavBar(),
        arguments: 0.obs,
      );
      customSnakBar(mass: 'Order Was Added..');
    } on FirebaseException catch (e) {
      debugPrint(e.message);
      dismissLoadingWidget();
      routeController.routePage(
        type: 'offAll',
        page: () => CustonNavBar(),
        arguments: 0.obs,
      );
      customSnakBar(
        mass: 'we have some error try again later..\n${e.message}',
      );
    }
    update();
  }

  updateCheckOutParameter() {
    checkoutController.addressGroupValue.value = 0;
    checkoutController.deliveryGroupValue.value = 0;
    checkoutController.deliveryDate.value = '';
    update();
  }
}
