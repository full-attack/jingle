import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jingle/constants.dart';
import 'package:jingle/screens/chats/chat_screen.dart';
import 'package:jingle/screens/profile/profile_screen.dart';
import '../friends/friends_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    FriendsScreen(),
    ChatsScreen(),
    ProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: pageList[pageIndex],
      body:PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
      FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
      ),
            child: pageList[pageIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: contentColorLightTheme,
        //selectedIconTheme: IconThemeData(color:kPrimaryColor),
        //selectedItemColor: Colors.white60,
        //  unselectedItemColor: contentColorDarkTheme.withOpacity(0.32),
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Friends"),
          BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage("assets/images/user_2.png"),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
