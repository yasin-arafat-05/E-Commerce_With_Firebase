import 'package:eapp/models/products_model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
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
                  },
                  icon: Icon(
                    widget.singleproductModel.isFavourite
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
                  onPressed: () {},
                  child: const Text("Add To Cart"),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {},
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
