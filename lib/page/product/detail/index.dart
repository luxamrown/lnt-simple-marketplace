import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lnt_simple_marketplace/service/auth/auth.dart';
import 'package:lnt_simple_marketplace/service/product/product.dart';

class DetailProductPage extends StatefulWidget {
  final ProductService productService;

  const DetailProductPage(
      {Key? key, required this.productService})
      : super(key: key);

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Card(
          shadowColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                  "udah pegel",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(Colors.grey.shade700.value)),
                  ),
                ),
                Text(
                  'Rp 2000',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(Colors.grey.shade700.value)),
                  ),
                  ),
            ],
          ),
        )
          ],
        ),
      ),
    );
  }
}