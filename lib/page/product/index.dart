import 'package:flutter/material.dart';
import 'package:lnt_simple_marketplace/model/product.dart';
import 'package:lnt_simple_marketplace/page/product/add/index.dart';
import 'package:lnt_simple_marketplace/page/product/detail/index.dart';
import 'package:lnt_simple_marketplace/page/product/edit/index.dart';
import 'package:lnt_simple_marketplace/page/product/list/index.dart';
import 'package:lnt_simple_marketplace/service/product/product.dart';

class ProductPage {
  final productService = ProductService();

  Widget renderListProduct() {
    return ListProduct(productService: productService);
  }

  Widget renderAddProduct() {
    return AddProductPage(productService: productService);
  }

  Widget renderEditProduct(Product productDetail) {
    return EditProductPage(productService: productService, productDetail: productDetail);
  }

  Widget renderDetailProduct(String id) {
    return DetailProductPage(productService: productService, productId: id,);
  }
}