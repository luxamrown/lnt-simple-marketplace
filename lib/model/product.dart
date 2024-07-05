import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lnt_simple_marketplace/constant.dart';

class Product {
  String? id;
  String? name;
  String? desc;
  int? quantity;
  int? price;
  String? category;

  Product({
    this.id,
    this.name,
    this.desc,
    this.quantity,
    this.price,
    this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'desc': desc,
      'quantity': quantity,
      'price': price,
      'category': category
    };
  }

  factory Product.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    
    return Product(
      id: doc.id,
      name: data[FIELD_NAME],
      desc: data[FIELD_DESC],
      quantity: data[FIELD_QUANTITY],
      price: data[FIELD_PRICE],
      category: data[FIELD_CATEGORY]
    );
  }
}