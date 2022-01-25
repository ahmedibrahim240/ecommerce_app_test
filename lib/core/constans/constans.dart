export 'custom_colors.dart';
export 'firebase.dart';
export 'controllers.dart';
export 'asset_paths.dart';
export 'sharedPreferences.dart';
export 'app_theme.dart';

import 'package:ecommerce_app/core/services/size_config.dart';

String? userToken;

double defaultSize = SizeConfig.defaultSize!;
double screenWidth = SizeConfig.screenWidth!;
double screenHeight = SizeConfig.screenHeight!;

//!Cart const Names
const String DBCARTNAME = 'cart';
const String CARTPRODUCTTITLE = 'tilte';
const String CARTPRODUCTIMAGE = 'image';
const String CARTPRODUCTID = 'productId';
const String CARTPRODUCTPRICE = 'price';
const String CARTPRODUCTQUANTITIY = 'quantity';
