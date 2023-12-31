import 'package:eapp/models/products_model/product_model.dart';
import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier {
  //This setup enables widgets to listen for changes
  //in the cart and update accordingly when products are add

  // state management for adding product
  final List<ProductModel> _cartProductList = [];
  void addCartProduct(ProductModel productModel) {
    _cartProductList.add(productModel);
    notifyListeners();
  }

  // state management for removing product
  void removeCartProduct(ProductModel productModel) {
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  /*
  The last line of the code defines a getter method getCartProductList
  that allows external classes or widgets to access the private _cartProductList variable.
  For _(usersore and final ) we can't use it other class 
  simply its a  getter method.
  */
  List<ProductModel> get getCartProductList => _cartProductList;

  //---------------Now state management for favourite icon---------------------
  final List<ProductModel> _favouriteIconList = [];
  void addFavouriteProduct(ProductModel productModel) {
    _favouriteIconList.add(productModel);
    notifyListeners();
  }

  // state management for removing favourite icon
  void removeFavouriteProduct(ProductModel productModel) {
    _favouriteIconList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getFavouriteIconList => _favouriteIconList;
}
