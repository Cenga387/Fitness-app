import 'package:fitness_app/pages/challenge_card.dart';
import 'package:fitness_app/pages/home_page.dart';
import 'package:fitness_app/pages/profile_page.dart';
import 'package:fitness_app/pages/reg_page.dart';
import 'package:fitness_app/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 1;

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
          icon: Icon(
            Icons.search,
            color: _currentIndex == 1 ? Color.fromARGB(255, 194, 146, 0) : null,
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
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

class ChallengeListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
            'Challenges',
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
              color: Color.fromARGB(34, 94, 82, 4),
            ), // Hamburger menu icon
            onPressed: () {
              showMenu(
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                context: context,
                position: RelativeRect.fromLTRB(100, 80, 0, 0),
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
                        Navigator.pop(context);
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
      bottomNavigationBar: MyBottomNavigationBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: ListView(
          children: [
            ChallengeCard(),
            ChallengeCard(),
            ChallengeCard(),
            ChallengeCard(),
            ChallengeCard(),
            ChallengeCard(),
          ],
        ),
      ),
    );
  }
}

class ChallengeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Challenge name',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Time required',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WorkoutPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        primary: Color.fromARGB(255, 0, 70, 3)),
                    child: Text('View challenge'),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: FractionallySizedBox(
              widthFactor: 0.4,
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/girlOnBike.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
