class Endpoints{
  static const _API_BASE = "grocery-second-app.herokuapp.com";
  static const _REGISTER = "api/auth/register";
  static const _LOGIN = "api/auth/login";
  static const _CATEGORY = "/api/category";
  static const _SUBCATEGORY = "/api/subcategory";
  static const _IMAGE_BASE = "https://rjtmobile.com/grocery/images/";

  static Uri get login => Uri.https(_API_BASE, _LOGIN);
  static Uri get register => Uri.https(_API_BASE, _REGISTER);
  static Uri get categories => Uri.https(_API_BASE, _CATEGORY);
  static Uri get subcategories => Uri.https(_API_BASE, _SUBCATEGORY);

  static Uri subcatFromCat(int catId)=> Uri.https(_API_BASE, "$_SUBCATEGORY/$catId");
  static Uri productsFromSubcat(int subcatId)=>Uri.https(_API_BASE, "/api/products/sub/$subcatId");



  static String imageUrl(String path) => "$_IMAGE_BASE$path";
}