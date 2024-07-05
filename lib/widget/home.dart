import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lnt_simple_marketplace/constant.dart';
import 'package:lnt_simple_marketplace/widget/category_card.dart';
import 'package:lnt_simple_marketplace/widget/product_card.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final TextEditingController _keywordController = TextEditingController();

  String keyword = '';
  String selectedCategory = "food";

  void onClearKeyword() {
    _keywordController.clear();
    setState(() {
      keyword = '';
    });
  }

  void handleChangeCategory(String category) {
    setState(() {
      selectedCategory = category == selectedCategory ? '' : category;
    });
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
            Container(
                child: TextField(
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: Color(Colors.grey.shade700.value)),
                    controller: _keywordController,
                    textInputAction: TextInputAction.go,
                    onChanged: (value) => {
                          setState(() {
                            keyword = value;
                          })
                        },
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide.none),
                        hintText: 'Search..',
                        hintStyle: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: Color(Colors.grey.shade500.value)),
                        ),
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: keyword.length > 0
                            ? IconButton(
                                onPressed: onClearKeyword,
                                icon: Icon(Icons.close_outlined))
                            : null))),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.maxFinite,
              child: Text("Category",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Color(Colors.blue.value)),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: MasterCategories.map((e) => CategoryCard(
                      value: e!,
                      selected: e['code'] == selectedCategory ? true : false,
                      onTap: handleChangeCategory,
                    )).toList(),
              ),
            ),
            Column(
              children: [
            ProductCard(),

              ],
            )
            
          ],
        ),
        
      ),
      ) 
    );
  }
}
