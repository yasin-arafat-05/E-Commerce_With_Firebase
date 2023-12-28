import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //--------------------------------- B L I N K Text-----------------
            const SizedBox(
              height: kToolbarHeight,
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
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
            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(31, 204, 123, 123),
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                  ),
                  hintText: "S E A R C H",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //--------------------------------- Categories TEXXT -----------------
            const Padding(
              padding: EdgeInsets.all(4.0),
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
                          color: Colors.white,
                          elevation: 13.0,
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.network(e),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            //--------------------------------- Top SELLING -----------------
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "Best Products",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> categoryList = [
  'https://static.vecteezy.com/system/resources/previews/019/607/567/original/fast-food-vector-clipart-design-graphic-clipart-design-free-png.png',
  'https://static.vecteezy.com/system/resources/previews/019/607/567/original/fast-food-vector-clipart-design-graphic-clipart-design-free-png.png',
  'https://static.vecteezy.com/system/resources/previews/019/607/567/original/fast-food-vector-clipart-design-graphic-clipart-design-free-png.png',
  'https://static.vecteezy.com/system/resources/previews/019/607/567/original/fast-food-vector-clipart-design-graphic-clipart-design-free-png.png',
  'https://static.vecteezy.com/system/resources/previews/019/607/567/original/fast-food-vector-clipart-design-graphic-clipart-design-free-png.png',
  'https://static.vecteezy.com/system/resources/previews/019/607/567/original/fast-food-vector-clipart-design-graphic-clipart-design-free-png.png',
  'https://static.vecteezy.com/system/resources/previews/019/607/567/original/fast-food-vector-clipart-design-graphic-clipart-design-free-png.png',
  'https://static.vecteezy.com/system/resources/previews/019/607/567/original/fast-food-vector-clipart-design-graphic-clipart-design-free-png.png',
  'https://static.vecteezy.com/system/resources/previews/019/607/567/original/fast-food-vector-clipart-design-graphic-clipart-design-free-png.png'
];
