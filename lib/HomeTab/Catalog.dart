import 'package:LunasTalaan/MedicineDetailView.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<CatalogPage> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop =
        MediaQuery.of(context).size.width > 768;

    return Container(
      color: Colors.black12,
      padding: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isDesktop
              ? Center(
            child: Container(
              width: 500,
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    size: 40,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),
            ),
          )
              : Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
                suffixIcon: Icon(
                  Icons.search,
                  size: 40,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ),
          Text(
            'Medicine & Vitamins by Category',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 20.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterButton('Cough'),
                FilterButton('Fever'),
                FilterButton('Flu'),
                FilterButton('Diarrhea'),
                FilterButton('Colds'),
                FilterButton('Sore throat'),
                FilterButton('Multivitamins'),
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Container(
              width: isDesktop ? 350 : double.infinity,
              height: 425,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Image.asset(
                                'assets/Onboarding.png',
                                width: 170,
                                height: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Brand Name:',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Bomvital Forte',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      'Generic Name:',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'MultiVitamins',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailView()),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(0.0),
                                        child: Text(
                                          'View All',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.blue,
                                            decoration:
                                            TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 5,
                          right: 5,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _isLiked = !_isLiked;
                              });
                            },
                            child: Icon(
                              _isLiked ? Icons.favorite : Icons.favorite_border,
                              color: _isLiked ? Colors.red : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    color: Colors.white,
                    height: 200,
                    width: double.infinity,
                  ),
                  SizedBox(height: 15),
                  Container(
                    color: Colors.white,
                    height: 200,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}





class FilterButton extends StatefulWidget {
  final String filterName;

  FilterButton(this.filterName);

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.blue,
          backgroundColor: isSelected ? Colors.blue : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric( horizontal: 10.0),
          child: Text(
            widget.filterName,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    );
  }
}