import 'package:eapp/constants/constants.dart';
import 'package:eapp/models/products_model/product_model.dart';
import 'package:eapp/provider/app_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleCartItem extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleCartItem({super.key, required this.singleProduct});

  @override
  State<SingleCartItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  int qnty = 1;
  @override
  Widget build(BuildContext context) {
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
                    //------Increase and Decrease number  ----------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CupertinoButton(
                            padding: const EdgeInsets.all(0),
                            child: const CircleAvatar(
                              backgroundColor: Colors.red,
                              maxRadius: 13,
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (qnty > 1) {
                                  qnty--;
                                }
                              });
                            }),
                        Text(
                          qnty.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CupertinoButton(
                            padding: const EdgeInsets.all(0),
                            child: const CircleAvatar(
                              backgroundColor: Colors.red,
                              maxRadius: 13,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                qnty++;
                              });
                            }),
                      ],
                    ),
                    //--------------------WishList Buttion----------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: const Text("Add to wishlist"),
                        ),
                        //--------------------Delete Buttion----------------
                        CupertinoButton(
                            padding: const EdgeInsets.all(0),
                            child: const CircleAvatar(
                              backgroundColor: Colors.red,
                              maxRadius: 13,
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              AppProvider appProvider =
                                  Provider.of<AppProvider>(context,
                                      listen: false);
                              appProvider
                                  .removeCartProduct(widget.singleProduct);
                              showMessge("Remove from Card");
                            }),
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
