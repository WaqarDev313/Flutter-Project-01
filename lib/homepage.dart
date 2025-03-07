import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1B5E20), 
        title: Text(
          "Baba Guru Nanak University",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.all(6.0),
          child: Image.asset(
            "assets/logo.jpg",
            width: 60, 
            height: 60,
          ),
        ),
      ),

      // Body ka Design
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Left Side: VC ki Image
                Container(
                  width: 220, // VC Image size increased
                  height: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 3,
                        offset: Offset(0, 5),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage("assets/vc_image.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 35), // Increased space between image and text
                // Right Side: Paragraph
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15), // Shifted text slightly to the right
                    child: Text(
                      "Baba Guru Nanak University (BGNU) is a prestigious public sector institution located in Nankana Sahib, Punjab, Pakistan. "
                      "With an aim to accommodate over 15,000 students globally, the university was founded on October 28, 2019, "
                      "coinciding with the 550th Guru Nanak Gurpurab. Officially recognized in 2020, BGNU is envisioned as a world-class learning center.\n\n"
                      
                      "The university offers programs in Medicine, Pharmacy, Engineering, Computer Science, Languages, Music, and Social Sciences. "
                      "A budget of Rs. 6 billion has been allocated for its development, with phase-1 construction already in progress.",
                      style: TextStyle(fontSize: 17, color: Colors.black87, height: 1.6),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      //  Footer
      bottomNavigationBar: Container(
        color: Color(0xFF1B5E20),
        padding: EdgeInsets.all(15),
        child: Text(
          "© 2025 Baba Guru Nanak University",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
