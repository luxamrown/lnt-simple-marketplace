import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lnt_simple_marketplace/constant.dart';
import 'package:lnt_simple_marketplace/page/product/add/index.dart';
import 'package:lnt_simple_marketplace/widget/category_card.dart';
import 'package:lnt_simple_marketplace/widget/home.dart';
class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final TextEditingController _keywordController = TextEditingController();

  int _indexMenu = 0;
       
    final List<Widget> _widgetOptions = <Widget>[
    const HomeWidget(),
    const AddProductPage(),
    Text(
      'Index 2: School'
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _indexMenu = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Add Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _indexMenu,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_indexMenu),
      ),
    );
  }
}
