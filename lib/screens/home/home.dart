import 'package:eapp/firebase_helper/firebase_firestore/firebase_firestore.dart';
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
    setState(() {
      isLoding = false;
    });
  }

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
                  //--------------------------------- Categories TEXXT -----------------
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
                  //--------------------------------- Categories Box----------------
                  //------------------------This is new to me explanation------------
                  /*
            This code creates a horizontally scrollable row of cards.

            Here, map is used to transform each element e in categoryList into a Padding widget. 
            In Dart, the map function is commonly used to transform elements of one iterable 
            into another iterable. It doesn't necessarily require key-value pairs.

            
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
                    child: GridView.builder(
                      itemCount: bestProduct.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 3,
                        childAspectRatio: 0.9,
                        crossAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) {
                        //fetch single product of type ProductModel.
                        ProductModel singleProduct = bestProduct[index];
                        return Card(
                          elevation: 10,
                          // color: const Color.fromRGBO(244, 67, 54, 1) .withOpacity(0.3),
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
                                height: 6,
                              ),
                              Image.network(
                                singleProduct.image,
                                height: 60,
                                width: 80,
                              ),
                              const SizedBox(
                                height: 12.0,
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
                                height: 10,
                              ),

                              SizedBox(
                                height: 50,
                                width: 100,
                                child: OutlinedButton(
                                  onPressed: () {},
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
    );
  }
}

//--------------------------------Product MOdel----------------------------
List<ProductModel> bestProduct = [
  ProductModel(
    id: "1",
    image:
        "https://parspng.com/wp-content/uploads/2023/01/applepng.parspng.com-6.png",
    name: "Apple",
    price: "1",
    description:
        "Indulge in the crisp sweetness of our premium apples, carefully selected for their quality and flavor. Bursting with natural goodness, each apple promises a delightful and nutritious snack. Elevate your well-being with our handpicked apples, perfect for a healthy and satisfying treat. Experience the wholesome taste of nature – bite into freshness with every apple from our collection!",
    status: "Pending",
    isFavourite: false,
  ),
  ProductModel(
    id: "2",
    image: "https://pngimg.com/d/mango_PNG9168.png",
    name: "Mango",
    price: "1",
    description:
        "Savor the tropical sweetness of our exquisite mangoes, meticulously chosen to bring you the essence of sun-kissed indulgence. With a succulent texture and vibrant flavor, our premium mangoes offer a taste of paradise in every bite. Elevate your snacking experience with these juicy delights, rich in vitamins and antioxidants. Treat yourself to the lusciousness of our handpicked mangoes – a delectable journey to tropical bliss awaits!",
    status: "Pending",
    isFavourite: false,
  ),
  ProductModel(
    id: "3",
    image: "https://pngimg.com/d/watermelon_PNG2654.png",
    name: "Watermelon",
    price: "3",
    description:
        "Dive into refreshing bliss with our succulent watermelons, selected for their juiciness and crispness. Experience the hydrating burst of sweetness as you bite into each slice, delivering a perfect summer sensation. Packed with vitamins and hydration, our premium watermelons are a delicious way to stay refreshed. Indulge in the cool, juicy delight – a delightful taste of summer in every juicy wedge!",
    status: "Pending",
    isFavourite: false,
  ),
  ProductModel(
    id: "4",
    image:
        "https://static.vecteezy.com/system/resources/previews/029/228/607/original/jackfruit-transparent-background-free-png.png",
    name: "Jackfruit",
    price: "3",
    description:
        "Embark on a culinary adventure with our premium jackfruit, chosen for its robust flavor and versatile appeal. Delight your senses with the sweet and fragrant essence of this tropical gem. From savory dishes to sweet treats, our carefully selected jackfruit promises a unique and wholesome experience. Experience the exotic charm – bite into the richness of nature's bounty with our finest jackfruit selection!",
    status: "Pending",
    isFavourite: false,
  ),
];
