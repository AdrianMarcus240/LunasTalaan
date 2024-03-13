import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPage createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool emailSent = false;

  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Password Reset Link Sent'),
            content: Text('Check your email for the password reset link.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(e.message.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(45.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 1.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.lightBlue,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/LunasWbg.png',
                    height: 220,
                  ),
                ),

                Text(
                  'Reset Password',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'Poppins'),
                ),

                SizedBox(height: 20),
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
                    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
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
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      resetPassword();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.lightBlue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    minimumSize:
                        MaterialStateProperty.all<Size>(Size(200, 50)),
                  ),
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
