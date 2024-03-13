import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            _buildContainerWithDescription(
              'https://www.fda.gov.ph/wp-content/uploads/2022/03/FDA-Advisory-No.2022-0611-2.png',
              "Mga Bobo!",
            ),
            SizedBox(height: 40),
            _buildContainerWithDescription(
              'https://www.fda.gov.ph/wp-content/uploads/2022/03/FDA-Advisory-No.2022-0611-2.png',
              "Condom",
            ),
            SizedBox(height: 40),
            _buildContainerWithDescription(
              'https://www.fda.gov.ph/wp-content/uploads/2022/03/FDA-Advisory-No.2022-0611-2.png',
              "Durex",
            ),
            SizedBox(height: 40),
            _buildContainerWithDescription(
              'https://www.fda.gov.ph/wp-content/uploads/2022/03/FDA-Advisory-No.2022-0611-7.png',
              "Orange na gamot",
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildContainerWithDescription(String imageUrl, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.black26,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            description,
            style: TextStyle(
              fontFamily: 'Poppins'
            ),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
