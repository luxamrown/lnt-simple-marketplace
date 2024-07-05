import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef HandleChangeCallBack = Function(String type);

class CategoryCard extends StatelessWidget {
  final Map<String, String> value;
  final bool selected;
  final HandleChangeCallBack onTap;

  const CategoryCard({
    super.key,
    required this.value,
    this.selected=false,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(value['code']!),
      child: Card(
        shadowColor: Colors.transparent,
        color: selected ? Color(Colors.blue.shade400.value) : Color(Colors.grey.shade100.value),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(value['label']!,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: selected ? Color(Colors.grey.shade100.value) : Color(Colors.grey.shade700.value)),
              )),
        ),
      ),
    );
  }
}
