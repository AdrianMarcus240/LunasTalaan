import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailView extends StatefulWidget {
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final List<String> imageAssetPaths = [
    'assets/Onboarding.png',
    'assets/Onboarding2.png',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: screenWidth / 200.0,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1.0,
                    onPageChanged: (index, _) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: imageAssetPaths.map((assetPath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          color: Colors.white,
                          width: screenWidth,
                          margin: EdgeInsets.symmetric(horizontal: 0.0),
                          child: Image.asset(
                            assetPath,
                            fit: BoxFit.cover,
                            width: screenWidth,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Positioned(
                  top: 16.0,
                  left: 16.0,
                  child: GestureDetector(
                    onTap: () {
                      // Handle back icon tap
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.lightBlueAccent,
                      size: 32.0,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageAssetPaths.map((url) {
                      int index = imageAssetPaths.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.lightBlueAccent
                              : Colors.grey,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
        SizedBox(height: 20),
          Container(
            width: 350,
            margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: ExpansionTile(
              title: Text(
                'General Information',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                    fontFamily:'Poppins'
                ),
              ),
              trailing: null,
              childrenPadding: EdgeInsets.only(right: 16.0),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'asjdjsaldjklsajdkljsakjdkjasjdklajkldjsakjdkljaskljdkljasdjaskljdklajskljdaskljd.',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 350,
            margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: ExpansionTile(
              title: Text(
                'Dosage and Usage',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                    fontFamily:'Poppins'
                ),
              ),
              trailing: null,
              childrenPadding: EdgeInsets.only(right: 16.0),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'hashdlsahldhsahdhaskldhksalhdklhasldhsaklhklhsakldhklsahdklsa.',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 350,
            margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: ExpansionTile(
              title: Text(
                'Safety and Side Effects',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                    fontFamily:'Poppins'
                ),
              ),
              trailing: null,
              childrenPadding: EdgeInsets.only(right: 16.0),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '.',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 350,
            margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: ExpansionTile(
              title: Text(
                'Administration and Forms',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                    fontFamily:'Poppins'
                ),
              ),
              trailing: null,
              childrenPadding: EdgeInsets.only(right: 16.0),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '.',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 350,
            margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: ExpansionTile(
              title: Text(
                'Packaging and Manufacturer',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                    fontFamily:'Poppins'
                ),
              ),
              trailing: null,
              childrenPadding: EdgeInsets.only(right: 16.0),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '.',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 350,
            margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: ExpansionTile(
              title: Text(
                'Frequently Asked Qustions',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily:'Poppins'
                ),
              ),
              trailing: null,
              childrenPadding: EdgeInsets.only(right: 16.0),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '.',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ),
            Container(
              width: 350,
              margin: EdgeInsets.only(bottom: 10.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: ExpansionTile(
                title: Text(
                  'Price',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily:'Poppins'
                  ),
                ),
                trailing: null,
                childrenPadding: EdgeInsets.only(right: 16.0),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '.',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Add your onTap logic here
              },
              child: Container(
                width: 350,
                margin: EdgeInsets.only(bottom: 10.0),
                padding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.report,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'REPORT ADVERSE DRUG REACTION',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          'DISCLAIMER: The information on this application is intended for both medical professionals and public medication knowledge. It is collected from open sources and may contain significant errors. Exercise caution, double-check all the information, consult with your physician, and refrain from self-medication based solely on the details provided here. Your health is important, and professional medical advice is crucial for safe and effective medication use.',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black54,
                            fontFamily: 'Poppins'
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextButton(
                          onPressed: () {
                            // Add your onPressed logic here
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.info,
                                color: Colors.black45,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Report issue with content',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
        ],
      ),
      ),
    );
  }

  Widget buildIndicator(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index ? Colors.blue : Colors.grey.shade400,
      ),
    );
  }
}

