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

  Future<void> updateProduct(Product productData) {
    return firestoreInstance().collection(productCollectionConst).doc(productData.id).update(productData.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>  getAllProduct() {
    return firestoreInstance().collection(productCollectionConst).snapshots() as Stream<QuerySnapshot<Map<String, dynamic>>>;

    // return FirebaseFirestore.instance.collection("products").snapshots();

  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getDetailProduct(String id) async {
    final selectedProduct = await firestoreInstance().collection(productCollectionConst).doc(id).snapshots();

    if(await selectedProduct.isEmpty){
      throw Exception("Product Not Found");
    }

    return selectedProduct as Stream<QuerySnapshot<Map<String, dynamic>>>;
  }



  void deleteProduct(String id) {
    firestoreInstance().collection(productCollectionConst).doc(id).delete();
  }
}