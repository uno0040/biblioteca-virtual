import 'package:application_muito_foda/Pages/adminPages/HomeAdmin.dart';
import 'package:application_muito_foda/Pages/adminPages/InfAdmin.dart';
import 'package:application_muito_foda/Pages/cadastro.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class Admin_screen extends StatefulWidget {
  static const String id = 'Admin_screen';

  const Admin_screen({Key? key}) : super(key: key);

  @override
  _Admin_screenState createState() => _Admin_screenState();
}

class _Admin_screenState extends State<Admin_screen> {
    int _selectedIndex = 0;

    static List<Widget> screens = <Widget>[
      HomeAdmin(),
      CadastroPage(),
      InfAdmin(),
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
                text: 'Historico de emprestimo',
              ),
              GButton(
                icon: Icons.book,
                text: 'Cadastro de livros',
              ),
              GButton(
                icon: Icons.shelves,
                text: 'Arcevo',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
