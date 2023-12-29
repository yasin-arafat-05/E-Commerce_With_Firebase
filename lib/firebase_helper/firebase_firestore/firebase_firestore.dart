import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eapp/constants/constants.dart';
import 'package:eapp/models/category_model/category_model.dart';

class FirebaseFirestoreHelper {
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async {
    try {
      //More in websites: flutterFire -> Colud Firestore
      //When performing a query, Firestore returns either
      //a QuerySnapshot or a DocumentSnapshot.
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseFirestore.collection('/CollectionProduct').get();

      /*

       To access the documents within a QuerySnapshot,
       call the docs property, which returns a List containing
       DocumentSnapshot classes.
       */

      /*
      .map((e) => CategoryModel.fromJson(e.data())): 
      The map function is applied to each DocumentSnapshot.
      It transforms each DocumentSnapshot into a CategoryModel using the provided function.

      CategoryModel.fromJson(e.data()): This part assumes that there is a method 
      called fromJson in your CategoryModel class that takes a 
      Map (representing the data of a document) and constructs a 
      CategoryModel object from it. This is a common pattern
      when working with JSON serialization and deserialization in Dart/Flutter.

      .toList(): Finally, the result of the map operation is converted into a List<CategoryModel>.
    */
      List<CategoryModel> categoriestList = querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList();
      return categoriestList;
    } catch (e) {
      showMessge(e.toString());
      return [];
    }
  }
}
