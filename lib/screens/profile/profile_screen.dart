import 'package:firebase_auth/firebase_auth.dart';
import 'package:jingle/components/primary_button.dart';
import 'package:jingle/constants.dart';
import 'package:flutter/material.dart';

import '../signUp/signup_screen.dart';
import 'components/info.dart';
import 'components/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            ProfilePic(image: "assets/images/icon_9.png"),
            Text(
              "Якупов Ильшат",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6,
            ),
            Divider(height: defaultPadding * 2),
            Info(
              infoKey: "User ID",
              info: "@easyil",
            ),
            Info(
              infoKey: "Location",
              info: "Moscow, Russia",
            ),
            Info(
              infoKey: "Phone",
              info: "(917) 364-45-95",
            ),
            Info(
              infoKey: "Email Address",
              info: "yakupov_il96@mail.ru@mail.ru",
            ),
            SizedBox(height: defaultPadding),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 120,
                child: PrimaryButton(
                  padding: EdgeInsets.all(5),
                  text: "Edit Profile",
                  press: () {},
                ),
              ),

            ),
            SizedBox(height: defaultPadding),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 120,
                child: PrimaryButton(
                  padding: EdgeInsets.all(5),
                  text: "Logout",
                  press: () async {
                    await _auth.signOut();
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => SigninOrSignupScreen()));
                  },
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
//   @override
//   Widget logout(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("Home Screen"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: ()async{
//           await _auth.signOut();
//           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
//         },
//         child: Icon(Icons.logout),
//       ),
//     );
//   }
// }
