import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'reg_page.dart';
import 'profile_page.dart';
import 'challenges_list_page.dart';
import 'package:flutter/cupertino.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int waterCount = 0;
  int foodIntake = 0;
  int selectedFoodIntake = 0;
  String subtitleText = '0/1800 kcal';
  TimeOfDay? sleepTime;
  TimeOfDay? wakeUpTime;

  void selectWakeUpTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 12, minute: 0),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            timePickerTheme: TimePickerThemeData(backgroundColor: Colors.grey),
            colorScheme: ColorScheme.light().copyWith(
              primary: Color.fromARGB(255, 0, 70, 3),
            ),
            textTheme: TextTheme(
              labelSmall: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      setState(() {
        wakeUpTime = pickedTime;
      });
    }
  }

  void selectSleepTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 12, minute: 0),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(backgroundColor: Colors.grey),
            colorScheme: ColorScheme.light(
              secondary: Colors.grey,
              primary: Color.fromARGB(255, 0, 70, 3), // Dark green accent color
            ),
            textTheme: TextTheme(
              labelSmall: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      setState(() {
        sleepTime = pickedTime;
      });
    }
  }

  void incrementWater() {
    setState(() {
      if (waterCount < 8) {
        waterCount++;
      }
    });
  }

  void decrementWater() {
    setState(() {
      if (waterCount > 0) {
        waterCount--;
      }
    });
  }

  void updateFoodIntake(int value) {
    setState(() {
      foodIntake += value;
      subtitleText = '$foodIntake/1800 kcal';
    });
  }

  void openFoodIntakePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        int selectedValue = selectedFoodIntake;

        return Container(
          color: Colors.grey,
          height: 400.0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Select Calorie Intake',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 70.0,
                  onSelectedItemChanged: (int index) {
                    selectedValue = index;
                  },
                  children: List<Widget>.generate(601, (int index) {
                    return Center(
                      child: Text(style: TextStyle(fontSize: 25), '$index'),
                    );
                  }),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 0, 70, 3),
                    fixedSize: Size(100, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                onPressed: () {
                  setState(() {
                    selectedFoodIntake = selectedValue;
                    foodIntake += selectedFoodIntake;
                    subtitleText = '$foodIntake/1800 kcal';
                  });
                  Navigator.pop(context);
                },
                child: Text(style: TextStyle(fontSize: 15), 'Done'),
              ),
            ],
          ),
        );
      },
    );
  }

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
            'Home',
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
      body: Container(
        color: Colors.transparent,
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              height: 100.0,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30.0)),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                title: Text('Food intake',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: Text('$foodIntake/1800 kcal',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black, // Change the text color here
                    )),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(120, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      backgroundColor: Color.fromARGB(255, 0, 70, 3)),
                  onPressed: () {
                    openFoodIntakePicker();
                    setState(() {});
                  },
                  child: Text('Enter'),
                ),
              ),
            ),
            Container(
              height: 100.0,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Water',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Today: $waterCount/8 glasses',
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(40, 40),
                      shape: CircleBorder(),
                      backgroundColor: Color.fromARGB(255, 0, 70, 3),
                    ),
                    onPressed: incrementWater,
                    child: Text(style: TextStyle(fontSize: 20), '+'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(40, 40),
                      shape: CircleBorder(),
                      primary: Color.fromARGB(255, 0, 70, 3),
                    ),
                    onPressed: decrementWater,
                    child: Text(style: TextStyle(fontSize: 30), '-'),
                  ),
                ],
              ),
            ),
            Container(
              height: 100.0,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30.0)),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                title: Text(
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                    'Trending exercises'),
                subtitle: Text(
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                    'Running, Push-ups, Sit-ups'),
              ),
            ),
            Container(
              height: 100.0,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30.0)),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                title: Text(
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                    'Sleep'),
                subtitle: sleepTime != null && wakeUpTime != null
                    ? Text(
                        'Sleep time: ${sleepTime!.format(context)}\nWake up time: ${wakeUpTime!.format(context)}',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      )
                    : Text(
                        'How did you sleep?',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                      ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(120, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      backgroundColor: Color.fromARGB(255, 0, 70, 3)),
                  onPressed: () {
                    selectWakeUpTime();
                    selectSleepTime();
                  },
                  child: Text('Enter'),
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
