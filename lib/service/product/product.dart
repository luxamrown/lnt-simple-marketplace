import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lnt_simple_marketplace/model/product.dart';
import 'package:lnt_simple_marketplace/service/index.dart';

class ProductService extends FirebaseService {
  final String productCollectionConst = "products";

  Future<DocumentReference?> addProduct(Product productData) async {
    try {
       DocumentReference document = await firestoreInstance().collection(productCollectionConst).add(productData.toMap());

       return document;
    } catch (e) {
      return null;
    }
  }

  Future updateProduct(Product productData) async {
    try {
      print(productData.toMap());
      await firestoreInstance().collection(productCollectionConst).doc(productData.id).update(productData.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllProduct([String category = ""]) {
    late Query<Map<String, dynamic>> products = firestoreInstance().collection(productCollectionConst);
    
    if(category.isNotEmpty) {
      products = products.where("category", isEqualTo: category);
    }
    
    return products.snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getDetailProduct(String id) {
    try {
      return firestoreInstance().collection(productCollectionConst).doc(id).snapshots();
    } catch (e) {
      rethrow;
    }
  }

  Future deleteProduct(String id) async {
    try {
      await firestoreInstance().collection(productCollectionConst).doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }
}