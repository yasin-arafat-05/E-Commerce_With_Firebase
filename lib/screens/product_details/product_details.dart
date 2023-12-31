import 'package:eapp/constants/constants.dart';
import 'package:eapp/models/products_model/product_model.dart';
import 'package:eapp/provider/app_provider.dart';
import 'package:eapp/screens/cart_screen/cart_screen.dart';
import 'package:eapp/screens/favourite_screen/favourite_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eapp/constants/routes.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleproductModel;
  const ProductDetails({super.key, required this.singleproductModel});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    /*
  Provider.of(context) is used to obtain the 
  current instance of the AppProvider class from the widget tree.

  listen: false is used to indicate that the widget does 
  not need to rebuild when the AppProvider state changes. 
  This is set to false because the widget does not depend 
  on changes in the AppProvider for its UI.
  */
    AppProvider appProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Routes.instance.push(const CartScreen(), context);
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //------------------------------Load Image-------------------------
            Image.network(
              widget.singleproductModel.image,
              height: 300,
            ),
            const SizedBox(
              height: 5,
            ),
            //---------------Get Product Name and Favourite --------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.singleproductModel.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.singleproductModel.isFavourite =
                          !widget.singleproductModel.isFavourite;
                    });
                    if (widget.singleproductModel.isFavourite) {
                      appProvider
                          .addFavouriteProduct(widget.singleproductModel);
                    } else {
                      appProvider
                          .removeFavouriteProduct(widget.singleproductModel);
                    }
                  },
                  icon: Icon(
                    appProvider.getFavouriteIconList
                            .contains(widget.singleproductModel)
                        ? Icons.favorite
                        : Icons.favorite_outline,
                  ),
                ),
              ],
            ),
            //------------------------------Get Product price-------------------
            Text(
              "Price: \$ ${widget.singleproductModel.price}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            //------------------------Get Product Description-------------------
            Text(widget.singleproductModel.description),
            //--------------Button For order Plus Quentity Minus----------------
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CupertinoButton(
                  borderRadius: BorderRadius.circular(50),
                  padding: const EdgeInsets.all(0),
                  color: Colors.red.withOpacity(0.8),
                  child: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) {
                        quantity--;
                      }
                    });
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  quantity.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                CupertinoButton(
                  borderRadius: BorderRadius.circular(50),
                  padding: const EdgeInsets.all(0),
                  color: Colors.red.withOpacity(0.8),
                  child: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            //----------------Button For Add to cart and buy--------------------
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // To send the value of the  number of quantity.
                    ProductModel productModel =
                        widget.singleproductModel.copyWith(quntity: quantity);
                    appProvider.addCartProduct(productModel);
                    showMessge("ADDED TO CART");
                  },
                  child: const Text("ADD TO CART"),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Routes.instance.push(const FavouriteScreen(), context);
                    },
                    child: const Text("BUY"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}
