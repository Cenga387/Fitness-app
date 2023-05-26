import 'package:fitness_app/pages/challenges_list_page.dart';
import 'package:fitness_app/pages/home_page.dart';
import 'package:fitness_app/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'reg_page.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
            color: _currentIndex == 2 ? Color.fromARGB(255, 194, 146, 0) : null,
          ),
          label: 'Profile',
        ),
      ],
      backgroundColor: const Color.fromARGB(255, 63, 63, 63),
      selectedItemColor: Color.fromARGB(255, 194, 146, 0),
      unselectedItemColor: Colors.grey,
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChallengeListScreen()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    }
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isSwitchOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 194, 146, 0),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegPage()),
            );
          },
        ),
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 194, 146, 0),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Color.fromARGB(255, 194, 146, 0),
            ), // Hamburger menu icon
            onPressed: () {
              showMenu(
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                context: context,
                position: RelativeRect.fromLTRB(
                    100, 80, 0, 0), // Adjust the position as needed
                items: [
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Settings',
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                      onTap: () {
                        // Handle Settings button press
                        Navigator.pop(context); // Close the sliding menu
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      title: Text('Log Out',
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.0)),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomePage()));
                      },
                    ),
                  ),
                ],
                elevation: 8.0,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: CircleAvatar(
                radius: 60.0,
              ),
            ),
            SizedBox(height: 6.0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 194, 146, 0),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              child: Text('Edit'),
              onPressed: () {
                // Handle edit button press
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(150, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  primary: Color.fromARGB(255, 0, 70, 3)),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '180 cm',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 194, 146, 0)),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Height',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: const Color.fromARGB(255, 194, 146, 0)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '80 kg',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 194, 146, 0)),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Weight',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: const Color.fromARGB(255, 194, 146, 0)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '22 yo',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 194, 146, 0)),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Age',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: const Color.fromARGB(255, 194, 146, 0)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24.0),
            Container(
              width: 310,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.grey,
              ),
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  InkWell(
                    onTap: () {
                      // Handle Personal Data click
                    },
                    child: Row(
                      children: [
                        Icon(Icons.person), // Replace with desired icon
                        SizedBox(width: 8.0),
                        Text('Personal Data', style: TextStyle(fontSize: 18.0)),
                        Spacer(),
                        Icon(Icons
                            .arrow_forward_ios), // Replace with desired icon
                      ],
                    ),
                  ),
                  SizedBox(height: 12.0),
                  InkWell(
                    onTap: () {
                      // Handle Achievements click
                    },
                    child: Row(
                      children: [
                        Icon(Icons.star), // Replace with desired icon
                        SizedBox(width: 8.0),
                        Text('Achievements', style: TextStyle(fontSize: 18.0)),
                        Spacer(),
                        Icon(Icons
                            .arrow_forward_ios), // Replace with desired icon
                      ],
                    ),
                  ),
                  SizedBox(height: 12.0),
                  InkWell(
                    onTap: () {
                      // Handle Activity click
                    },
                    child: Row(
                      children: [
                        Icon(Icons.directions_run), // Replace with desired icon
                        SizedBox(width: 8.0),
                        Text('Activity', style: TextStyle(fontSize: 18.0)),
                        Spacer(),
                        Icon(Icons
                            .arrow_forward_ios), // Replace with desired icon
                      ],
                    ),
                  ),
                  SizedBox(height: 12.0),
                  InkWell(
                    onTap: () {
                      // Handle Workout Progress click
                    },
                    child: Row(
                      children: [
                        Icon(Icons.fitness_center), // Replace with desired icon
                        SizedBox(width: 8.0),
                        Text('Workout Progress',
                            style: TextStyle(fontSize: 18.0)),
                        Spacer(),
                        Icon(Icons
                            .arrow_forward_ios), // Replace with desired icon
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Container(
                  width: 310,
                  height: 100,
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.grey,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notification',
                        style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 1.0),
                      Row(
                        children: [
                          Icon(Icons.notifications),
                          Expanded(
                            child: Text(
                              'Pop-up notification',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                          ),
                          Switch(
                            value: _isSwitchOn,
                            onChanged: (value) {
                              setState(() {
                                _isSwitchOn = value;
                              });
                            },
                            activeColor: Color.fromARGB(255, 0, 70, 3),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
