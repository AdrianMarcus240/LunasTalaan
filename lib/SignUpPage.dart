import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:LunasTalaan/LoginPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Passwords do not match'),
            duration: Duration(seconds: 2),
          ),
        );
        return;
      }
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        if (userCredential.user != null) {
          // Add user data to Firestore
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userCredential.user!.uid)
              .set({
            'email': _emailController.text.trim(),
          });

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to create account'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } catch (e) {
        // Handle errors
        print("Error: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            duration: Duration(seconds: 2),
          ),
        );
      }
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
                    SizedBox(height: 1),
                    Text(
                      'Create your Account',
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
                        } else if (!RegExp(
                                r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                            .hasMatch(value)) {
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
                    SizedBox(height: 10),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
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
                    SizedBox(height: 10),
                    Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: _obscurePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm password is required';
                        } else if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
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
                    SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: _submitForm,
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
                        'Sign Up',
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
                          'Already have an account? ',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Sign in',
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
