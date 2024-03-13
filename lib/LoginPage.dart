import 'package:flutter/material.dart';
import 'package:LunasTalaan/HomePage.dart';
import 'package:LunasTalaan/SignUpPage.dart';
import 'package:LunasTalaan/ForgotPasswordPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Index()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to sign in: $e'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(45.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/LunasWbg.png',
                        height: 220,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Login your account',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Email Address',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email address is required';
                        } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: TextStyle(
                          color: Colors.black12,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
                        prefixIcon: Icon(
                          Icons.email_sharp,
                          size: 20,
                          color: Colors.black12,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Password',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.black12,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 20,
                          color: Colors.black12,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black12,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black38),
                        ),
                      ),
                    ),
                    SizedBox(height: 0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _signInWithEmailAndPassword(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter a valid email address'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.blue),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.black38,
                            thickness: 1,
                            indent: 1,
                            endIndent: 10,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Or',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black38,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.black38,
                            thickness: 1,
                            indent: 10,
                            endIndent: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.black12),
                          ),
                        ),
                        elevation: MaterialStateProperty.all<double>(0),
                        minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/google.png',
                            height: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Sign in with Google',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dont have an account? ',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpPage()),
                            );
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
