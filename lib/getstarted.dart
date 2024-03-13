import 'package:flutter/material.dart';
import 'package:LunasTalaan/LoginPage.dart';

class getStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Image.asset(
                  'assets/LunasTalaan.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth > 600 ? 40.0 : 20.0),
                child: Text(
                  'Bawat Tala,\nKalusugan ay Alaga',
                  style: TextStyle(
                    fontSize: screenWidth > 600 ? 28 : 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth > 600 ? 80.0 : 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.lightBlue,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 18.0),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: screenWidth > 600 ? 20 : 17,
                      fontFamily: 'Poppins',
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.lightBlue,
    );
  }
}