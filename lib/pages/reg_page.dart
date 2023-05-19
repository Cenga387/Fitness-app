import 'dart:ui';
import 'package:fitness_app/pages/profile_page.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 16, right: 16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    'Before we begin',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(255, 149, 112, 0),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    'Please tell us about yourself',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                      color: const Color.fromARGB(255, 149, 112, 0),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17.0)),
                            labelText: 'Full Name',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17.0)),
                            labelText: 'Email',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your email';
                          }
                          // Add additional email validation logic if needed
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17.0)),
                            labelText: 'Password',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        obscureText: true,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter a password';
                          }
                          // Add additional password validation logic if needed
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _weightController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17.0)),
                            labelText: 'Weight (kg)',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your weight';
                          }
                          final weight = int.tryParse(value!);
                          if (weight == null || weight < 1) {
                            return 'Please enter a weight that is larger than 0';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _heightController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17.0)),
                            labelText: 'Height (cm)',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your height';
                          }
                          final height = int.tryParse(value!);
                          if (height == null || height < 1 || height > 250) {
                            return 'Please enter a valid height (1-250 cm)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _dobController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17.0)),
                            labelText: 'Date of Birth',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        onTap: () async {
                          // Display date picker when the text field is tapped
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );

                          if (selectedDate != null) {
                            final dateFormatter = DateFormat('yyyy-MM-dd');

                            // Update the date of birth field with the selected date
                            setState(() {
                              _dobController.text =
                                  dateFormatter.format(selectedDate);
                            });
                          }
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your date of birth';
                          }
                          final dob = DateTime.tryParse(value!);
                          if (dob == null) {
                            return 'Please enter a valid date of birth';
                          }
                          final age =
                              DateTime.now().difference(dob).inDays ~/ 365;
                          if (age < 16) {
                            return 'You must be at least 16 years old to create an account';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      DropdownButtonFormField<String>(
                        value: _selectedGender,
                        items: ['Male', 'Female', 'Other']
                            .map((gender) => DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                ))
                            .toList(),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17.0)),
                            labelText: 'Gender',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please select your gender';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 70, 3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    fixedSize: Size(double.infinity, 70),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {}
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: Text(
                    'Skip Registration(demo)',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
