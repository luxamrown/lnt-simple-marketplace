import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lnt_simple_marketplace/model/profile.dart';
import 'package:lnt_simple_marketplace/page/auth/login/index.dart';
import 'package:lnt_simple_marketplace/service/auth/auth.dart';

class RegisterPage extends StatefulWidget {
  final AuthService authService;

  const RegisterPage({ Key? key, required this.authService }): super(key: key);
  
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _telNumController = TextEditingController();

  bool _passwordVisible = false;
  bool _passwordConfirmationVisible = false;
  bool _submitLoading = false;

  final formKeyReg = GlobalKey<FormState>();

  String fullname = '';
  String email = '';
  String password = '';
  String telNum = '';

  void onClickRevoke([bool isConfirmation = false]) {
    if (isConfirmation) {
      setState(() {
        _passwordConfirmationVisible = !_passwordConfirmationVisible;
      });
    } else {
      setState(() {
        _passwordVisible = !_passwordVisible;
      });
    }
  }

  void handleSubmit() async {
    setState(() {
      _submitLoading = true;
    });

    final scaffoldMessenger = ScaffoldMessenger.of(context);

    if (formKeyReg.currentState!.validate()) {
      formKeyReg.currentState!.save();

      final newUser = Profile(
          email: email, fullname: fullname, telNum: telNum, password: password);

      var result = await widget.authService.signUp(newUser);

      if (result != null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginPage(authService: widget.authService,)));
      }

      scaffoldMessenger.showSnackBar(SnackBar(
          content:
              Text(result != null ? "Register Success" : "Register Failed")));
    }

    setState(() {
      _submitLoading = false;
    });
  }

  handleTapLogin(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage(authService: widget.authService,)));
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
                  child: Image.asset("assets/Mobile login-pana.png")),
              Container(
                width: double.maxFinite,
                child: Text("Register",
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
                  children: [
                    TextFormField(
                      key: ValueKey('email'),
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          prefixIcon: Icon(Icons.email)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          email = value!;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      key: ValueKey('fullname'),
                      controller: _fullnameController,
                      decoration: InputDecoration(
                          labelText: 'Full Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          prefixIcon: Icon(Icons.person)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Fullname is required';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          fullname = value!;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      key: ValueKey('telNum'),
                      controller: _telNumController,
                      decoration: InputDecoration(
                          labelText: 'Telephone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          prefixIcon: Icon(Icons.smartphone)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Telephone Number is required';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          telNum = value!;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      key: ValueKey('password'),
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28)),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: () => onClickRevoke(),
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
                          password = value!;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      key: ValueKey('passwordConfirmation'),
                      controller: _passwordConfirmationController,
                      obscureText: !_passwordConfirmationVisible,
                      decoration: InputDecoration(
                          labelText: 'Password Confirmation',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28)),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: () => onClickRevoke(true),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password Confirmation is required';
                        } else if (value != _passwordController.text) {
                          return 'Password not match';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          password = value!;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: double.maxFinite,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () => handleTapLogin(context),
                                child: Text(
                                    "Already have an account? Login here",
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              Color(Colors.blue.value),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          color: Color(Colors.blue.value)),
                                    )),
                              )
                            ])),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                        width: double.maxFinite,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _submitLoading ? null : handleSubmit,
                          child: Text(
                            _submitLoading ? "Loading" : "Register",
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
