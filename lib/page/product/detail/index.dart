import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lnt_simple_marketplace/page/index.dart';
import 'package:lnt_simple_marketplace/service/auth/auth.dart';
import 'package:lnt_simple_marketplace/service/product/product.dart';

class DetailProductPage extends StatefulWidget {
  final ProductService productService;
  final String productId;

  const DetailProductPage(
      {Key? key, required this.productService, required this.productId})
      : super(key: key);

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  late Stream<DocumentSnapshot<Map<String, dynamic>>>? _productDetailStream;

  @override
  void initState() {
    super.initState();
    _productDetailStream =
        widget.productService.getDetailProduct(widget.productId);
  }

  void handleDelete() {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      widget.productService.deleteProduct(widget.productId);

      setState(() {
        _productDetailStream = null;
      });
      
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => IndexPage()));
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text("Delete Product Failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: _productDetailStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else {
                      final data = snapshot.data;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data!['name'],
                              textAlign: TextAlign.left,
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w900,
                                    color: Color(Colors.grey.shade900.value)),
                              )),
                          Text("Rp. ${data!['price']}",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color(Colors.grey.shade800.value)),
                              )),
                          Text(data!['desc'],
                              textAlign: TextAlign.left,
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Color(Colors.grey.shade500.value)),
                              )),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                              width: double.maxFinite,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Edit Product",
                                  style: TextStyle(color: Colors.grey.shade900),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade300, shadowColor: Colors.transparent),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              width: double.maxFinite,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: handleDelete,
                                child: Text(
                                  "Delete Product",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                              )),
                        ],
                      );
                    }
                  },
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
