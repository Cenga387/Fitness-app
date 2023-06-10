import 'package:fitness_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class WorkoutFinished extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.grey[850], // Set the background color of the page to dark grey
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Align the content at the center vertically
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Align the content at the center horizontally
              children: [
                SizedBox(
                  height: 100,
                ),
                Image.asset(
                  'assets/images/workoutFinished.png',
                  height: 350,
                  width: 350,
                ),
                SizedBox(
                    height: 16.0), // Add spacing between the logo and the text
                Text(
                  'Congratulations,You Have ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign
                      .center, // Align the text at the center horizontally
                ),
                Text(
                  'Finished The Challenge',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign
                      .center, // Align the text at the center horizontally
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text(
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.normal),
                        'Share'),
                  ),
                  SizedBox(height: 20.0), // Add spacing between the tabs
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
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text(
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.normal),
                        'Back to home'),
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
