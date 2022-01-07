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
  OrderHistoryListModels orderHistoryListModels = OrderHistoryListModels();
  @override
  void onReady() {
    super.onReady();
    if ((userToken != null) && (userToken != 'null')) getAllOderHistory();
    // ignore: invalid_use_of_protected_member
  }

  createOders(OrderHistoryModels order) async {
    showLoading();
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
        for (var order in orderHistoryList) {
          OrderHistoryModels orderHistoryModels = order;
          listOforders.add(orderHistoryModels.tojson());
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
      bestSellingControllers.updataProduct(inCart: false, type: "all");
      await getAllOderHistory();

      titles = [];
      checkoutController.addressGroupValue.value = 0;
      checkoutController.deliveryGroupValue.value = 0;
      checkoutController.deliveryDate.value = '';
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

  getAllOderHistory() async {
    OrderHistoryListModels orderHistoryListModels = OrderHistoryListModels();
    orderHistoryList.value = [];
    var newList = [];
    await firebaseFirestore
        .collection(ordersCollection)
        .doc(userToken)
        .get()
        .then(
      (value) {
        if (value.data() != null) {
          orderHistoryListModels = OrderHistoryListModels.formjson(value);
          newList = orderHistoryListModels.ordersList!;
          for (int i = 0; i < newList.length; i++) {
            var order = newList[i];

            orderHistoryList.add(
              OrderHistoryModels.fromjson(order),
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
