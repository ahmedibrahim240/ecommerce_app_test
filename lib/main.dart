import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'core/controllers/controllers.dart';
import 'core/services/enums/connectivity_status.dart';
import 'core/services/network_services/connectivity_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(AuthControllers());
    Get.put(RouteController());
    Get.put(NavBarController());
    Get.put(CategoriesControllers());
    Get.put(RefreshContrllors());
    Get.put(BestSellingControllers());
    Get.put(CartContllors());
    Get.put(AccountController());
    Get.put(CheckoutController());
    Get.put(AddressController());
    Get.put(SplachController());
  });
  var initialData = await ConnectivityService().getIntState();

  runApp(
    MultiProvider(
      providers: [
        StreamProvider<ConnectivityStatus>(
          create: (_) =>
              ConnectivityService().connectionStatusController.stream,
          initialData: initialData,
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MyApp> with WidgetsBindingObserver {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      if (accountController.isSystemMode.value)
        accountController.getThemeMode();

      return;
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce App',
        themeMode: accountController.themeMode.value,
        theme: accountController.switchDartMode(),
        darkTheme: AppTheme.darkTheme,
        home: SplashScreen(),
      );
    });
  }
}
