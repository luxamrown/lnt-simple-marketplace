import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lnt_simple_marketplace/constant.dart';
import 'package:lnt_simple_marketplace/model/product.dart';
import 'package:lnt_simple_marketplace/page/index.dart';
import 'package:lnt_simple_marketplace/service/product/product.dart';

class EditProductPage extends StatefulWidget {
  final ProductService productService;
  final Product productDetail;
  
  const EditProductPage({Key? key, required this.productService, required this.productDetail}) : super(key: key);

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late TextEditingController _nameController = TextEditingController();
  late TextEditingController _descController = TextEditingController();
  late TextEditingController _priceController = TextEditingController();
  late TextEditingController _quantityController = TextEditingController();

  String dropdownValue = MasterCategories.first['label']!;

  bool _submitLoading = false;

  final formKeyReg = GlobalKey<FormState>();

  String name = '';
  String desc = '';
  String quantity = '';
  String price = '';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.productDetail.name);
    _descController = TextEditingController(text: widget.productDetail.desc);
    _priceController = TextEditingController(text: widget.productDetail.price.toString());
    _quantityController = TextEditingController(text: widget.productDetail.quantity.toString());
  }

  void handleSubmit() async {
    setState(() {
      _submitLoading = true;
    });
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    late String scaffoldMessage = "";

    if (formKeyReg.currentState!.validate()) {
      formKeyReg.currentState!.save();

      final newProduct = Product(id: widget.productDetail.id, name: name, desc: desc, quantity: int.parse(quantity), price: int.parse(price), category: dropdownValue);
      try {
        await widget.productService.updateProduct(newProduct);

        scaffoldMessage = "Update Product Success";
        
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => IndexPage()));
      } catch (e) {
        scaffoldMessage = "Update Product Failed";
        
      }
      
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(scaffoldMessage)));
    }

    setState(() {
      _submitLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(28),
            child: Column(children: [
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
                      height: 20,
                    ),
                    Text("Product Quantity",
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
                      key: ValueKey('quantity'),
                      keyboardType: TextInputType.number,
                      controller: _quantityController,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Product Quantity',
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
                          return 'Quantity is required';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          quantity = value!;
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
                        initialSelection: widget.productDetail.category,
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
