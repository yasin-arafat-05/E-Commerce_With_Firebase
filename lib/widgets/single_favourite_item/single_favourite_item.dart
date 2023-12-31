import 'package:eapp/constants/constants.dart';
import 'package:eapp/models/products_model/product_model.dart';
import 'package:eapp/provider/app_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleFavouriteItem extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleFavouriteItem({super.key, required this.singleProduct});

  @override
  State<SingleFavouriteItem> createState() => _SingleFavouriteItemState();
}

class _SingleFavouriteItemState extends State<SingleFavouriteItem> {
  @override
  Widget build(BuildContext context) {
    //--------------instance of state manage class-------------------------
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.red,
          width: 3,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 130,
              color: Colors.red.withOpacity(0.1),
              child: Image.network(
                widget.singleProduct.image,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 140,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //------------------------Get Product name-------------------
                        Text(
                          widget.singleProduct.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //-------------------Get price -------------------
                        Text(" ${widget.singleProduct.price} \$"),
                      ],
                    ),
                    //--------------------WishList Buttion----------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            appProvider
                                .removeFavouriteProduct(widget.singleProduct);
                            showMessge("Remove From WishList");
                          },
                          child: const Text("Remove From WishList"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
