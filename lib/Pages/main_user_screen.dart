import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:application_muito_foda/Pages/userPages/config.dart';
import 'package:application_muito_foda/Pages/userPages/home.dart';
import 'package:application_muito_foda/Pages/userPages/userBook.dart';


class Main_user_screen extends StatefulWidget {
  static const String id = 'Main_user_screen';

  const Main_user_screen({Key? key}) : super(key: key);

  @override
  _MainUserScreenState createState() => _MainUserScreenState();
}

class _MainUserScreenState extends State<Main_user_screen> {
  int _selectedIndex = 0;

  static List<Widget> screens = <Widget>[
    Home(),
    UserHistoric(),
    ConfigScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(30.0, 3.0),
            topRight: Radius.elliptical(30.0, 3.0),
          ),
          color: Colors.white70,
          
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            backgroundColor: Colors.white70,
            color: Colors.deepPurple.shade300,
            activeColor: Colors.deepPurple.shade300,
            tabBackgroundColor: Colors.grey.shade100,
            gap: 8,
            duration: Duration(milliseconds: 500),
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Página inicial',
              ),
              GButton(
                icon: Icons.book,
                text: 'Livros',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Configurações',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
