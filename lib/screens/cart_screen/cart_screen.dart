/*

In Flutter, the Provider package is commonly used for state management. 
It allows you to efficiently share and manage the state of your application 
across different widgets. Provider eliminates the need for passing down state 
through constructors and helps in separating the UI from the business logic. 
It is especially useful for handling complex state scenarios in 
applications, such as managing shopping carts, user authentication, and more.

-> In the cardScreen we need the information the specific product where we
from click .
we use provider to fetch the information in a efficienent way.

---------------------good--------------------------------
              Provider(information)
                |
      --------------------------------------------------
      |           |             |                       |
  User Auth    shop_homepage  product_details     product cart


---------------------bad--------------------------------
              userAuth(information)
                |
              ------
                 |                        
           shop_homepage 
                  |
          product_details  
                  |
            product cart

*/

import 'package:eapp/provider/app_provider.dart';
import 'package:eapp/widgets/single_cart_item/single_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int qnty = 1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of(context);
    return Scaffold(
      //-----------------------------App Bar Style ---------------------------
      appBar: AppBar(
        elevation: 10,
        title: const Text(
          "Cart Screen",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //-----------------------------App Bar Style ---------------------------
      body: appProvider.getCartProductList.isEmpty
          ? const Center(child: Text("Cart is Empty."))
          : ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: appProvider.getCartProductList.length,
              itemBuilder: (context, index) {
                return SingleCartItem(
                  singleProduct: appProvider.getCartProductList[index],
                );
              },
            ),
    );
  }
}
