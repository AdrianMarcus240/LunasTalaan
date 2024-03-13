import 'package:flutter/material.dart';

class Trivia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00A1CE),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 370.0,
                  height: 170.0,
                  child: Image.asset(
                    'assets/trivia.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 350.0,
                height: 280.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Ikaw na Bahala dito Ad',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 115, vertical: 16),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.white),
                  ),
                ),
                child: Text(
                  'Generate Trivia',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00A1CE),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 110, vertical: 16),
                  backgroundColor: Color(0xFF00A1CE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.white),
                  ),
                ),
                child: Text(
                  'Save Screenshot',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
