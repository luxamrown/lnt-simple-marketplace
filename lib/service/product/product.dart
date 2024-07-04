import 'package:lnt_simple_marketplace/constant.dart';
import 'package:lnt_simple_marketplace/model/product.dart';
import 'package:lnt_simple_marketplace/service/index.dart';

class ProductService extends FirebaseService {
  Future<void> addProduct(Product productData) {
    return productService().add(productData.toMap());
  }

  Future<void> updateProduct(Product productData) {
    return productService().doc(productData.id).update(productData.toMap());
  }

  Stream<List<Product>> getAllProduct() {
    return productService().snapshots().map((event) => event.docs.map((e) => Product.fromFireStore(e)).toList());
  }

  Future<Product?> getDetailProduct(String id) async {
    final selectedProduct = await productService().doc(id).get();

    if(!selectedProduct.exists){
      throw Exception("Product Not Found");
    }

    return Product(
      id: selectedProduct.id,
      name: selectedProduct[FIELD_NAME],
      desc: selectedProduct[FIELD_DESC],
      category: selectedProduct[FIELD_CATEGORY],
      quantity: selectedProduct[FIELD_QUANTITY],
      price: selectedProduct[FIELD_PRICE]
    );
  }
}