import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lnt_simple_marketplace/page/auth/index.dart';
import 'package:lnt_simple_marketplace/page/home.dart';
import 'package:lnt_simple_marketplace/service/auth/auth.dart';

class LoginPage extends StatefulWidget {
  final AuthService authService;
  
  const LoginPage({ Key? key, required this.authService }): super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool _submitLoading = false;

  final formKeyReg = GlobalKey<FormState>();

  String email = '';
  String password = '';

  onClickRevoke() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void handleSubmit() async {
    setState(() {
      _submitLoading = true;
    });
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    if (formKeyReg.currentState!.validate()) {
      formKeyReg.currentState!.save();

      var result =
          await widget.authService.signIn({'email': email, 'password': password});

      if (result != null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      }

      scaffoldMessenger.showSnackBar(SnackBar(
          content: Text(result != null ? "Login Success" : "Login Failed")));
    }

    setState(() {
      _submitLoading = false;
    });

  }

  handleTapRegister(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AuthPage().renderLogin()));
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
                  child: Image.asset("assets/Login-bro.png")),
              Container(
                width: double.maxFinite,
                child: Text("Login",
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
                        } else if (!value.contains("@")) {
                          return 'Invalid Email';
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
                            onPressed: onClickRevoke,
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else if(value.length < 6) {
                          return 'Password must be at least 6 characters';
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
                              onTap: () => handleTapRegister(context),
                              child: Text(
                                  "Don’t have an account yet? Register here",
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
                          ],
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
                            _submitLoading ? "Loading" : "Login",
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
