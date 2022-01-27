import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/core/services/coustm_dialogs.dart';
import 'package:ecommerce_app/models/order_history_models.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  String? address, orrderDate;
  List titles = [];
  String ordersCollection = "users_orders";
  List listOforders = [];
  var orderHistoryList = [].obs;
  var orderID = 0.obs;
  var newOrder;
  OrderHistoryListmodels orderHistoryListmodels = OrderHistoryListmodels();
  @override
  void onReady() {
    super.onReady();
    if ((userToken != null) && (userToken != 'null')) getAllOderHistory();
    // ignore: invalid_use_of_protected_member
  }

  createOders(OrderHistorymodels order) async {
    showLoading();
    String userId = authControllers.usermodels.value.id!;
    listOforders = [];
    newOrder = order.tojson();
    try {
      if (orderHistoryList.isEmpty) {
        listOforders.add(newOrder);
        orderHistoryListmodels = new OrderHistoryListmodels(
          ordersList: listOforders,
        );
        await firebaseFirestore.collection(ordersCollection).doc(userId).set(
              orderHistoryListmodels.tojson(),
            );
      } else {
        for (var order in orderHistoryList) {
          OrderHistorymodels orderHistorymodels = order;
          listOforders.add(orderHistorymodels.tojson());
        }
        listOforders.add(newOrder);

        orderHistoryListmodels = new OrderHistoryListmodels(
          ordersList: listOforders,
        );
        await firebaseFirestore.collection(ordersCollection).doc(userId).update(
              orderHistoryListmodels.tojson(),
            );
      }
      cartContllors.delateAllPrdect();
      productControllers.updataInCartProduct(inCart: false, type: "all");
      await getAllOderHistory();

      updateCheckOutParameter();
      dismissLoadingWidget();
      routeController.routePage(
        type: 'offAll',
        page: CustonNavBar(),
        arguments: 0.obs,
      );
      customSnakBar(mass: 'Order Was Added..');
    } catch (e) {
      print(e);
      dismissLoadingWidget();
      routeController.routePage(
        type: 'offAll',
        page: CustonNavBar(),
        arguments: 0.obs,
      );
      customSnakBar(mass: 'we have some error try again later..');
    }
    update();
  }

  updateCheckOutParameter() {
    titles = [];
    checkoutController.addressGroupValue.value = 0;
    checkoutController.deliveryGroupValue.value = 0;
    checkoutController.deliveryDate.value = '';
    update();
  }

  getAllOderHistory() async {
    OrderHistoryListmodels orderHistoryListmodels = OrderHistoryListmodels();
    orderHistoryList.value = [];
    var newList = [];
    await firebaseFirestore
        .collection(ordersCollection)
        .doc(userToken)
        .get()
        .then(
      (value) {
        if (value.data() != null) {
          orderHistoryListmodels = OrderHistoryListmodels.formjson(value);
          newList = orderHistoryListmodels.ordersList!;
          for (int i = 0; i < newList.length; i++) {
            var order = newList[i];

            orderHistoryList.add(
              OrderHistorymodels.fromjson(order),
            );
          }
        } else {
          return;
        }
      },
    );

    update();
  }

  getOrderID() {
    orderID.value = orderHistoryList.length;
  }
}
