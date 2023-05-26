import 'package:fitness_app/pages/home_page.dart';
import 'package:fitness_app/pages/reg_page.dart';
import 'package:flutter/material.dart';

class AfterWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/guyRunning.png', // Replace with your image asset path
              ),
              Text(
                'FITQUEST',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                  color: const Color.fromARGB(255, 149, 112, 0),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
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
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text(
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
                    'Log In'),
              ),
              SizedBox(height: 20),
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
                    'Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
