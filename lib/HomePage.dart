import 'package:LunasTalaan/HomeTab/Catalog.dart';
import 'package:LunasTalaan/HomeTab/GalleryPage.dart';
import 'package:LunasTalaan/HomeTab/IdentifierPage.dart';
import 'package:LunasTalaan/HomeTab/TriviPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:LunasTalaan/LoginPage.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = [
    CatalogPage(),
    IdentifierPage(),
    Trivia(),
    Gallery(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showWarningDialog();
    });
  }

  void _showWarningDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            width: 500.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Icon(
                    Icons.warning_amber_rounded,
                    size: 100.0,
                    color: Colors.lightBlue,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "ATTENTION!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "The Information on this application\n"
                          "is intended for both medical\n"
                          "professionals and public\n"
                          "medication knowledge. It is\n"
                          "collected from open sources and\n"
                          "may contain significant errors.\n"
                          "Excercise caution, double-check all\n"
                          "the information, consult with your\n"
                          "physician, and refrain from self-\n"
                          "medication based solely on the\n"
                          "details provided here.\n"
                          "\n"
                          "Your health is important, and\n"
                          "professional medical advice is\n"
                          "crucial for safe and effective\n"
                          "medication use.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.lightBlue,
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      "I Understand",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                    ),
                  ),

                  SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.white),
        leading: Container(),
        flexibleSpace: Container(
          height: 100.0,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/LunasWbg.png',
                    height: 100.0,
                  ),
                ),
              ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.warning_amber_rounded,
                          size: 37.0,
                          color: Colors.lightBlue,
                        ),
                        onPressed: () {
                          _showWarningDialog();
                        },
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(
                          Icons.person,
                          size: 37.0,
                          color: Colors.lightBlue,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      endDrawer: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Drawer(
            child: ListView(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 50),
                      CircleAvatar(
                        backgroundColor: Colors.lightBlue,
                        radius: 50.0,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      SizedBox(height: 60,)
                    ],
                  ),
                ),
                ListTile(
                  title: Text(
                    'Change Email',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Icon(
                    FontAwesomeIcons.at,
                    color: Colors.lightBlue,
                  ),
                  onTap: () {
                  },
                ),
                ListTile(
                  title: Text(
                    'Change Password',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Icon(
                    Icons.lock_outlined,
                    color: Colors.lightBlue,
                  ),
                  onTap: () {
                  },
                ),
                ListTile(
                  title: Text(
                    'Favorites',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Icon(
                    FontAwesomeIcons.heart,
                    color: Colors.lightBlue,
                  ),
                  onTap: () {
                  },
                ),
                ListTile(
                  title: Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Icon(
                    Icons.exit_to_app_rounded,
                    color: Colors.red,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.white,
          height: 90.0,
          border: Border(),
          activeColor: Colors.lightBlueAccent,
          items: [
            BottomNavigationBarItem(
              icon: const FaIcon(FontAwesomeIcons.magnifyingGlass, size: 45),
              label: "Catalog",
            ),
            BottomNavigationBarItem(
              icon: const FaIcon(FontAwesomeIcons.pills, size: 45),
              label: "Identifier",
            ),
            BottomNavigationBarItem(
              icon: const FaIcon(FontAwesomeIcons.lightbulb, size: 45),
              label: "Trivia",
            ),
            BottomNavigationBarItem(
              icon: const FaIcon(FontAwesomeIcons.images, size: 45),
              label: "Gallery",
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return CupertinoPageScaffold(

                child: _pages[index],
              );
            },
          );
        },
      ),
    );
  }
}
