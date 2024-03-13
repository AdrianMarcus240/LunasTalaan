import 'package:LunasTalaan/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:LunasTalaan/getstarted.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(LunasTalaanApp());
}

class LunasTalaanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Center(
            child: Opacity(
              opacity: _animation.value,
              child: Image.asset(
                'assets/LunasWbg.png',
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Image.asset(
                'assets/LunasWbg.png',
                height: 70.0,
                width: 80.0,
              ),
              SizedBox(width: 8.0),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => getStarted()),
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: MyCarousel(),
      ),
    );
  }
}

class MyCarousel extends StatefulWidget {
  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  final List<String> images = [
    'assets/Onboarding.png',
    'assets/Onboarding2.png',
    'assets/Onboarding3.png',
  ];

  final List<String> titles = [
    'EASY SEARCH AND PILL IDENTIFIER',
    'COUNTERFEIT GALLERY',
    'FUN AND INTERACTIVE TRIVIA',
  ];

  final List<String> descriptions = [
    'Welcome to LunasTalaan your gateway\n to healthcare clarity. Effortlessly find FDA-approved medicines and identify pills in seconds.',
    'Discover the power of knowledge with\n LunasTalaan. Explore our counterfeit\n medicine gallery to stay vigilant against\n fraudulent drugs.',
    'Make healthcare engaging with\n LunasTalaan\'s interactive trivia. Test your\n knowledge, debunk misconceptions, and\n enjoy learning.',
  ];

  int _currentIndex = 0;
  bool _manualPageChange = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider.builder(
          itemCount: images.length,
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.4,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              if (_manualPageChange) {
                setState(() {
                  _currentIndex = index;
                });
              }
            },
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Colors.lightBlueAccent
                    : Colors.grey,
              ),
            );
          }),
        ),
        SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                titles[_currentIndex],
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Flexible(
          child: SingleChildScrollView(
            child: Text(
              descriptions[_currentIndex],
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17.0,
                color: Colors.black38,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                  _manualPageChange = true;
                  if (_currentIndex < images.length - 1) {
                    _currentIndex = (_currentIndex + 1) % images.length;
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => getStarted()),
                    );
                  }
                  _manualPageChange = false;
                });
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                side: BorderSide(color: Colors.lightBlueAccent, width: 2.1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.lightBlueAccent,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
