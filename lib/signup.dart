import 'package:flutter/material.dart';
import 'package:project02/sharedPreference.dart';
import 'package:project02/home.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  String? errorMessage; // Error message variable

  void signupUser() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    setState(() {
      errorMessage = null;
    });

    // Email validation using RegExp
    RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      setState(() {
        errorMessage = "⚠ Please fill all fields!";
      });
    } else if (!emailRegex.hasMatch(email)) {
      setState(() {
        errorMessage = "⚠ Enter a valid email address!";
      });
    } else if (password.length < 6) {
      setState(() {
        errorMessage = "⚠ Password must be at least 6 characters!";
      });
    } else {
      // ✅ Save user details in SharedPreferences
      await UserPreferences.setUserDetails(name, email, password);
      await UserPreferences.setLoggedIn(true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => home()),
      );
    }

    // **Auto Hide Error After 3 Sec**
    if (errorMessage != null) {
      Future.delayed(Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            errorMessage = null;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A237E), Color(0xFF64B5F6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("images/logo.png", height: 80),
                  SizedBox(height: 20),
                  Text(
                    "Create an Account!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A237E)),
                  ),
                  SizedBox(height: 10),
                  Text("Sign up to get started", style: TextStyle(color: Colors.grey[600])),
                  SizedBox(height: 10),

                  // Error Message
                  if (errorMessage != null)
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error_outline, color: Colors.white, size: 20),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              errorMessage!,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 15),

                  // Name Field
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      prefixIcon: Icon(Icons.person, color: Color(0xFF1A237E)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  // Email Field
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email, color: Color(0xFF1A237E)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  // Password Field
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock, color: Color(0xFF1A237E)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: signupUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1A237E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
                    child: Text("Sign Up", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
