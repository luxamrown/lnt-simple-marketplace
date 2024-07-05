import 'package:flutter/material.dart';
import 'package:lnt_simple_marketplace/page/product/add/index.dart';
import 'package:lnt_simple_marketplace/page/product/detail/index.dart';
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

  Widget renderDetailProduct() {
    return DetailProductPage(productService: productService);
  }
}