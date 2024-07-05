import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lnt_simple_marketplace/constant.dart';
import 'package:lnt_simple_marketplace/model/product.dart';
import 'package:lnt_simple_marketplace/service/index.dart';

class ProductService extends FirebaseService {
  Future<DocumentReference?> addProduct(Product productData) async {
    try {
       DocumentReference document = await productService().add(productData.toMap());

       return document;
    } catch (e) {
      return null;
    }
  }

  Future<void> updateProduct(Product productData) {
    return productService().doc(productData.id).update(productData.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>  getAllProduct() {
    return productService().snapshots() as Stream<QuerySnapshot<Map<String, dynamic>>>;

    // return FirebaseFirestore.instance.collection("products").snapshots();

  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getDetailProduct(String id) async {
    final selectedProduct = await productService().doc(id).snapshots();

    if(await selectedProduct.isEmpty){
      throw Exception("Product Not Found");
    }

    return selectedProduct as Stream<QuerySnapshot<Map<String, dynamic>>>;
  }



  void deleteProduct(String id) {
    productService().doc(id).delete();
  }
}