import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {},
        child: Card(
          shadowColor: Colors.transparent,
          color: Color(Colors.grey.shade100.value),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(
                  'Sonu Nigam',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(Colors.grey.shade700.value)),
                  ),
                ),
                subtitle: Text(
                  'Rp 25.000.000',
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
