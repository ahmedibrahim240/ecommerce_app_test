import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/order_history_models.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  String? address, orrderDate;
  List<String>? titles = [];
  String ordersCollection = "users_orders";
  List listOforders = [];
  var orderHistoryList = [].obs;
  var orderID = 0.obs;
  var newOrder;
  OrderHistoryListModels orderHistoryListModels = OrderHistoryListModels();
  createOders(OrderHistoryModels order) async {
    String userId = authControllers.userModel.value.id!;
    listOforders = [];
    newOrder = order.tojson();
    try {
      if (orderHistoryList.isEmpty) {
        listOforders.add(newOrder);
        orderHistoryListModels = new OrderHistoryListModels(
          ordersList: listOforders,
        );
        await firebaseFirestore.collection(ordersCollection).doc(userId).set(
              orderHistoryListModels.tojson(),
            );
      } else {
        for (int i = 0; i > orderHistoryList.length; i++) {
          OrderHistoryModels orderHistoryModels = orderHistoryList[i];
          listOforders.add(orderHistoryModels);
        }
        listOforders.add(newOrder);
        orderHistoryListModels = new OrderHistoryListModels(
          ordersList: listOforders,
        );
        await firebaseFirestore.collection(ordersCollection).doc(userId).update(
              orderHistoryListModels.tojson(),
            );
      }
      cartContllors.delateAllPrdect();
      titles = [];
      checkoutController.addressGroupValue.value = 0;
      checkoutController.deliveryGroupValue.value = 0;
      checkoutController.deliveryDate.value = '';
      customSnakBar(mass: 'Order Was Added..');
    } catch (e) {
      print(e);
      customSnakBar(mass: 'we have some error try again later..');
    }
  }

  getOrderID() {
    orderID.value = orderHistoryList.length;
  }
}
