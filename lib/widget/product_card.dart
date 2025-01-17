import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef HandleClickCallBack = Function();
class ProductCard extends StatelessWidget {
  final name;
  final price;
  final HandleClickCallBack onTap;


  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
          shadowColor: Colors.transparent,
          color: Color(Colors.grey.shade100.value),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(
                  name,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(Colors.grey.shade700.value)),
                  ),
                ),
                subtitle: Text(
                  'Rp ${price}',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(Colors.grey.shade700.value)),
                  ),
                  ),
              ),
            ],
          ),
        ));
  }
}
