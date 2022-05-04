import 'package:jingle/components/primary_button.dart';
import 'package:jingle/constants.dart';
import 'package:flutter/material.dart';

import '../main/main_screen.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class SmsCodeScreen extends StatelessWidget {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Spacer(flex: 1),
              Image.asset("assets/images/logo-png.png"),
              // Image.asset(
              //   MediaQuery.of(context).platformBrightness == Brightness.light
              //       ? "assets/images/group_24.png"
              //       : "assets/images/group_24.png",
              //   height: 146,
              // ),
              Row(
                children: [
                  Text("We send code to your phone    "),
                  TweenAnimationBuilder(duration: Duration(seconds: 30),
                      tween: Tween(begin: Duration(seconds: 30), end: Duration.zero),
                    onEnd: () {
                      print('Timer ended');
                    },
                      builder: (BuildContext context, Duration value,
                          Widget? child) {
                        final minutes = value.inMinutes;
                        final seconds = value.inSeconds % 60;
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text('$minutes:$seconds',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)));
                      },
                  ),
                ],
              ),
              Spacer(flex: 2),
              const TextField(
                decoration: InputDecoration(
                    hintText: "Enter sms code"
                ),
              ),
              Spacer(flex:5),
              PrimaryButton(
                text: "Sign In",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding * 1.5),
              // PrimaryButton(
              //   color: Theme.of(context).colorScheme.secondary,
              //   text: "Sign Up",
              //   press: () {},
              // ),
              // Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
