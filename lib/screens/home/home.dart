import 'package:eapp/constants/routes.dart';
import 'package:eapp/firebase_helper/firebase_firestore/firebase_firestore.dart';
import 'package:eapp/screens/product_details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:eapp/models/category_model/category_model.dart';
import 'package:eapp/models/products_model/product_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoryList = [];
  List<ProductModel> bestProduct = [];
  bool isLoding = true;
// when the instance of Homestate is created
// it automatically invoke instate method()
/*
initState in a Flutter widget might seem similar to a constructor, 
they serve different purposes and have different timings in the widget lifecycle.
*/
  @override
  void initState() {
    getCategoryList();
    super.initState();
  }

  //-------Call the getCategorites from firebase_helper.----------
  Future<void> getCategoryList() async {
    categoryList = await FirebaseFirestoreHelper.instance.getCategories();
    bestProduct = await FirebaseFirestoreHelper.instance.bestSelling();
    // to show in random order
    bestProduct.shuffle();
    setState(() {
      isLoding = false;
    });
  }

  //--------scroll controller:
  //__________________________Main Code_____________________________
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // here we use ternary oprator. When it will finished the loading data
      // from firebase then our page will load.
      body: isLoding
          ? Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //--------------------------------- B L I N K Text-----------------
                    const SizedBox(
                      height: kToolbarHeight,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        "B L I N K",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //--------------------------------- Search Box-----------------
                    Card(
                      elevation: 20,
                      //color: Colors.red.withOpacity(0.1),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search_outlined,
                            color: Color.fromARGB(255, 150, 57, 57),
                          ),
                          hintText: "S E A R C H",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    //----------------------- Categories TEXXT -----------------
                    const Padding(
                      padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    //--------------------------- Categories Box----------------
                    //-----------------This is new to me explanation------------
                    /*
                    This code creates a horizontally scrollable row of cards.
                    
                    Here, map is used to transform each element e in categoryList into a Padding widget. 
                    In Dart, the map function is commonly used to transform elements of one iterable 
                    nto another iterable. It doesn't necessarily require key-value pairs.
                    
                                
                    In Dart, map returns an iterable, not a list. The toList() method 
                    is used to convert that iterable into a list.
                    The Row widget in Flutter expects its children to be a list of widgets.
                    This why we use .toList()
                                */
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: categoryList
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Card(
                                  //color: Colors.red.withOpacity(0.3),
                                  elevation: 10.0,
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.network(e.image),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    //--------------------------------- Top SELLING  Text -----------------
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 4, top: 4),
                      child: Text(
                        "Best Selling",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    //--------------------show top selling product with gridview-------

                    SizedBox(
                      height: 500,
                      child: GridView.builder(
                        itemCount: bestProduct.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: false,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 3,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 4,
                        ),
                        itemBuilder: (context, index) {
                          //fetch single product of type ProductModel.
                          ProductModel singleProduct = bestProduct[index];
                          return Card(
                            elevation: 10,
                            color: const Color.fromRGBO(244, 67, 54, 1)
                                .withOpacity(0.3),
                            /*
                             in this container we will degine the the best
                             selling product. 
                             and all the information we get throuth json data
                             from models/products_model 
                           */
                            child: Column(
                              children: [
                                // ---------first load image--------------
                                const SizedBox(
                                  height: 2,
                                ),
                                Image.network(
                                  singleProduct.image,
                                  height: 100,
                                  width: 100,
                                ),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                //---------Fetch the  product name --------------
                                Text(
                                  singleProduct.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                //---------Fetch the  product price --------------
                                Text(
                                  "Price: \$ ${singleProduct.price}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                //---------OutLine Button --------------
                                const SizedBox(
                                  height: 5,
                                ),

                                SizedBox(
                                  height: 50,
                                  width: 100,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Routes.instance.push(
                                          ProductDetails(
                                              singleproductModel:
                                                  singleProduct),
                                          context);
                                    },
                                    child: const Text(
                                      "Buy",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
