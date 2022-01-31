//todo assetsRootes
final String imageAssetsRoot = "assets/images/";
final String iconAssetsRoot = "assets/icons/";
final String svgAssetsRoot = "assets/svg/";
final String jsonAssetsRoot = "assets/json/";

//*icons
final String cartIcon = _getIconPath("cart.png");
final String userIcon = _getIconPath("user.png");
final String exploreIcon = _getIconPath("explore.png");
final String womenIcon = _getIconPath("women.png");
final String addressIcon = _getIconPath("address.png");
final String cardsIcon = _getIconPath("cards.png");
final String editIcon = _getIconPath("edit.png");
final String historyIcon = _getIconPath("history.png");
final String notificationIcon = _getIconPath("notification.png");
final String logOutIcon = _getIconPath("logOut.png");

//!ImagesPaTh
final String splash = _getImagePath("splash.png");
final String image1 = _getImagePath("image1.png");
final String image2 = _getImagePath("image2.png");

//**SvgPath */
final String emptyCartSvg = _getSvgPath("emptyCart.svg");
final String soppingAppSvg = _getSvgPath("soppingApp.svg");

//!ImagesJsonPaTh
final String deliveryIcon2 = _getJsonIconPath("delivery2.json");
final String emptyFavourite = _getJsonIconPath("empty_favourite.json");
final String emptyCartJson = _getJsonIconPath("emptycart.json");
final String emptyitemdata = _getJsonIconPath("noitem.json");
final String emptyorder = _getJsonIconPath("emptyorder.json");

//todo Get paths
String _getImagePath(String fileName) {
  return imageAssetsRoot + fileName;
}

String _getIconPath(String fileName) {
  return iconAssetsRoot + fileName;
}

String _getJsonIconPath(String fileName) {
  return jsonAssetsRoot + fileName;
}

String _getSvgPath(String fileName) {
  return svgAssetsRoot + fileName;
}
