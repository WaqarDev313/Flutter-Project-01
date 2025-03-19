import 'package:project02/calculator.dart';
import 'package:project02/grade.dart';
import 'package:flutter/material.dart';
import 'package:project02/sharedPreference.dart';
import 'package:project02/signin.dart';
import 'package:project02/signup.dart';
// import 'package:project02/signup.dart';
// import 'package:project02/output_show.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFA8E6CF),
          leading: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Image.asset('images/logo.png'),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BaBa Guru Nanak University',
                style: TextStyle(
                  color: Color(0xFF1A1363),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                'Nankana',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1363),
                ),
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFA8E6CF),
                ),
                accountName: Text('BGNU'),
                accountEmail: Text('bgnu@gmial.com'),
                currentAccountPicture: Container(
    alignment: Alignment.center, // Center align
    child: Image.asset(
      'images/logo.png',
      width: 60, // Adjust size if needed
      height: 60, // Adjust size if needed
    ),
  ),
              ),
              ListTile(
                leading: Icon(Icons.calculate_outlined, color: Color(0xff1A237E)),
                title: Text('Calculator', style: TextStyle(color: Color(0xff1A237E))),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Calculator()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.grade, color: Color(0xff1A237E)),
                title: Text('Grade', style: TextStyle(color: Color(0xff1A237E))),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => grade()),
                  );
                },
              ),

            ListTile(
  leading: Icon(Icons.person_add, color: Color(0xff1A237E)),
  title: Text('Signup', style: TextStyle(color: Color(0xff1A237E))),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Signup()),
    );
  },
),

ListTile(
  leading: Icon(Icons.login, color: Color(0xff1A237E)),
  title: Text('Signin', style: TextStyle(color: Color(0xff1A237E))),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Signin()),
    );
  },
),

ListTile(
  leading: Icon(Icons.logout, color: Color(0xff1A237E)),
  title: Text('Logout', style: TextStyle(color: Color(0xff1A237E))),
  onTap: () async {
    await UserPreferences.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Signin()), // Logout hone ke baad signin page pe redirect karega
    );
  },
),

            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30, width: 30),
              Image.asset(
                'images/backflaxs.jpg',
                width: screenHeight * 1.55,
                height: screenHeight * 0.75,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'About Us',
                  style: TextStyle(
                    color: Color(0xff1A237E),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: screenWidth * 0.8,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BaBa Guru Nanak University (BGNU)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1A237E),
                        ),
                      ),
                      Text(
                        'Baba Guru Nanak University (BGNU) is a Public sector university '
                        'located in District Nankana Sahib, in the Punjab region of Pakistan. It plans to facilitate between 10,000 to 15,000 students from all over the world at the university. The foundation stone of the university was laid on October 28, 2019 ahead of 550th of Guru Nanak Gurpurab by the Prime Minister of Pakistan. On July, 02, 2020 Government of Punjab has formally passed Baba Guru Nanak University Nankana Sahib Act 2020 (X of 2020).',
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Baba Guru Nanak University Nankana Sahib has also announced Centre of Excellence for Baba Guru Nanak & Sikh Cultural Heritage along with a separate Chair focusing on Punjab Studies.',
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Color(0xff1A237E),
                ),
                child: Center(
                  child: Text(
                    '© BGNU is Proudly Owned by BGNU',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
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