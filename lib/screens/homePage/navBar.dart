import 'package:drone_market/properties/prop.dart';
import 'package:drone_market/screens/homePage/homePage.dart';
import 'package:drone_market/screens/homePage/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class navBar extends StatefulWidget {
  const navBar({super.key});

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    homePage(),
    homePage(),
    profile(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: rangBackground,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(screenWidth * 0.005),
        child: Container(
          clipBehavior: Clip.none,
          // height: screenheight * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            // color: rang1
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: GNav(
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(
                  () {
                    _selectedIndex = index;
                  },
                );
              },
              tabBorderRadius: 50,
              textSize: screenheight * 0.50,
              rippleColor: rangRedAccent, // tab button ripple color when pressed
              hoverColor: rangText, // tab button hover color
              haptic: true, // haptic feedback
              // tabActiveBorder: Border.all(
              //   color: rangBlueN,
              //   width: 0,
              // ), // tab button border
              // tabBorder:
              //     Border.all(color: rangBlueN, width: 5), // tab button border
              // tabShadow: [
              //   BoxShadow(color: prop.rang1, blurRadius: 2)
              // ], // tab button shadow
              // curve: Curves.easeOutExpo, // tab animation curves
              // duration: Duration(milliseconds: 10), // tab animation duration
              gap: 2, // the tab button gap between icon and text
              color: rangRedAccent, // unselected icon color
              activeColor: rangBackground, // selected icon and text color
              // iconSize: 35, // tab button icon size
              tabBackgroundColor:
                  rangRedAccent, // selected tab background color
              // iconSize: screenWidth ,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.06,
                vertical: screenWidth * 0.03,
              ), // navigation bar padding
              tabs: [
                GButton(
                  icon: Icons.local_hospital_outlined,
                  text: 'BoT',
                  textSize: screenheight,
                ),
                GButton(
                  icon: Icons.access_time,
                  text: 'MarketPlace',
                  textSize: screenheight,
                ),
                GButton(
                  icon: Icons.account_circle_outlined,
                  text: 'Profile',
                  textSize: screenheight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
