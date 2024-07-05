import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lnt_simple_marketplace/constant.dart';
import 'package:lnt_simple_marketplace/model/product.dart';
import 'package:lnt_simple_marketplace/service/product/product.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final ProductService _productService = ProductService();

  String dropdownValue = MasterCategories.first['label']!;

  bool _submitLoading = false;

  final formKeyReg = GlobalKey<FormState>();

  String name = '';
  String desc = '';
  String price = '';

  void handleSubmit() async {
    setState(() {
      _submitLoading = true;
    });
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    if (formKeyReg.currentState!.validate()) {
      formKeyReg.currentState!.save();

      final newProduct = Product()

      _productService.addProduct()
    }

    setState(() {
      _submitLoading = false;
    });
  }

  handleTapRegister(BuildContext context) {
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthPage().renderRegister()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(28),
            child: Column(children: [
              SizedBox(
                height: 40,
              ),
              Container(
                  width: double.maxFinite,
                  child: Image.asset("assets/Create-rafiki.png")),
              Container(
                width: double.maxFinite,
                child: Text("Add Your Product!",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Color(Colors.blue.value)),
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              Form(
                key: formKeyReg,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Product Name",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(Colors.grey.shade700.value)),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      key: ValueKey('name'),
                      controller: _nameController,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Product Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          labelStyle: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Color(Colors.grey.shade400.value)),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          name = value!;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Product Price",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(Colors.grey.shade700.value)),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      key: ValueKey('price'),
                      keyboardType: TextInputType.number,
                      controller: _priceController,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Product Price',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          labelStyle: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Color(Colors.grey.shade400.value)),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Price is required';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          price = value!;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Product Description",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(Colors.grey.shade700.value)),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLines: 8,
                      key: ValueKey('desc'),
                      controller: _descController,
                      decoration: InputDecoration(
                          labelText: 'Description Here!',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28)),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          labelStyle: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Color(Colors.grey.shade400.value)),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          desc = value!;
                        });
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text("Product Category",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(Colors.grey.shade700.value)),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SizedBox(
                      child: DropdownMenu<String>(
                        initialSelection: MasterCategories.first['label'],
                        onSelected: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        dropdownMenuEntries:
                            MasterCategories.map<DropdownMenuEntry<String>>(
                                (Map<String, String> value) {
                          return DropdownMenuEntry<String>(
                              value: value['label']!, label: value['label']!);
                        }).toList(),
                      ),
                    )),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                        width: double.maxFinite,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _submitLoading ? null : handleSubmit,
                          child: Text(
                            _submitLoading ? "Loading" : "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                        )),
                  ],
                ),
              ),
            ])),
      ),
    );
  }
}
