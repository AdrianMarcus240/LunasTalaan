import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IdentifierPage extends StatefulWidget {
  @override
  _IdentifierState createState() => _IdentifierState();
}

class _IdentifierState extends State<IdentifierPage> {
  TextEditingController _searchController = TextEditingController();
  String? _selectedShape;
  String? _selectedForm;
  String? _selectedColor1;
  String? _selectedColor2;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black12,
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Center(
                child: SizedBox(
                  width: 350.0,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Pill Imprint',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(
                        FontAwesomeIcons.penClip,
                        size: 25,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            buildDropdown('Shape', ['Shape 1', 'Shape 2', 'Shape 3'], _selectedShape),
            buildDropdown('Form', ['Form 1', 'Form 2', 'Form 3'], _selectedForm),
            buildDropdown('Color 1', ['Color 1.1', 'Color 1.2', 'Color 1.3'], _selectedColor1),
            buildDropdown('Color 2', ['Color 2.1', 'Color 2.2', 'Color 2.3'], _selectedColor2),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  backgroundColor: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Search Pill',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
  Widget buildDropdown(String label, List<String> options, String? selectedValue) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFF3FC6BE),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        hint: Text(
          'Select $label',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 16,
          ),
        ),
        value: selectedValue,
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            if (label == 'Shape') {
              _selectedShape = value;
            } else if (label == 'Form') {
              _selectedForm = value;
            } else if (label == 'Color 1') {
              _selectedColor1 = value;
            } else if (label == 'Color 2') {
              _selectedColor2 = value;
            }
            _searchController.text = '';
          });
        },
        isExpanded: true,
        style: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}