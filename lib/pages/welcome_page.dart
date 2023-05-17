import 'package:flutter/material.dart';
import 'reg_page.dart'; // Import the registration page

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/welcome.png', // Replace with your image asset path
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to FITQUEST',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w100,
                  color: const Color.fromARGB(255, 149, 112, 0),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 0, 70, 3)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(Size(300, 60)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegPage()),
                  );
                },
                child: Text(
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
                    'Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
