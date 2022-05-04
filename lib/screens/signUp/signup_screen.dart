import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jingle/components/primary_button.dart';
import 'package:jingle/constants.dart';
import 'package:flutter/material.dart';
import 'sms_code.dart';
import '../main/main_screen.dart';

//
// enum MobileVerificationState {
//   SHOW_MOBILE_FORM_STATE,
//   SHOW_OTP_FORM_STATE,
// }
//
// class SigninOrSignupScreen extends StatelessWidget {
//   MobileVerificationState currentState =
//       MobileVerificationState.SHOW_MOBILE_FORM_STATE;
//
//   final phoneController = TextEditingController();
//   final otpController = TextEditingController();
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   late String verificationId;
//
//   bool showLoading = false;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//           child: Column(
//             children: [
//               Spacer(flex: 1),
//               Image.asset("assets/images/logo-png.png"),
//               // Image.asset(
//               //   MediaQuery.of(context).platformBrightness == Brightness.light
//               //       ? "assets/images/group_24.png"
//               //       : "assets/images/group_24.png",
//               //   height: 146,
//               // ),
//               Spacer(flex: 2),
//               const TextField(
//                 decoration: InputDecoration(
//                   hintText: "+7 | Your phone number"
//                 ),
//               ),
//               Spacer(flex:5),
//               PrimaryButton(
//                 text: "Send SMS Code",
//                 press: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SmsCodeScreen(),
//                   ),
//                 ),
//               ),
//               SizedBox(height: kDefaultPadding * 1.5),
//               // PrimaryButton(
//               //   color: Theme.of(context).colorScheme.secondary,
//               //   text: "Sign Up",
//               //   press: () {},
//               // ),
//               // Spacer(flex: 2),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   void signInWithPhoneAuthCredential(
//       PhoneAuthCredential phoneAuthCredential) async {
//     setState(() {
//       showLoading = true;
//     });
//
//     try {
//       final authCredential =
//       await _auth.signInWithCredential(phoneAuthCredential);
//
//       setState(() {
//         showLoading = false;
//       });
//
//       if(authCredential?.user != null){
//         Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreen()));
//       }
//
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         showLoading = false;
//       });
//
//       _scaffoldKey.currentState
//           ?.showSnackBar(SnackBar(content: Text(e.message)));
//     }
//   }
//
//   getMobileFormWidget(context) {
//     return Column(
//       children: [
//         Spacer(),
//         TextField(
//           controller: phoneController,
//           decoration: InputDecoration(
//             hintText: "Phone Number",
//           ),
//         ),
//         SizedBox(
//           height: 16,
//         ),
//         FlatButton(
//           onPressed: () async {
//             setState(() {
//               showLoading = true;
//             });
//
//             await _auth.verifyPhoneNumber(
//               phoneNumber: phoneController.text,
//               verificationCompleted: (phoneAuthCredential) async {
//                 setState(() {
//                   showLoading = false;
//                 });
//                 //signInWithPhoneAuthCredential(phoneAuthCredential);
//               },
//               verificationFailed: (verificationFailed) async {
//                 setState(() {
//                   showLoading = false;
//                 });
//                 _scaffoldKey.currentState.showSnackBar(
//                     SnackBar(content: Text(verificationFailed.message)));
//               },
//               codeSent: (verificationId, resendingToken) async {
//                 setState(() {
//                   showLoading = false;
//                   currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
//                   this.verificationId = verificationId;
//                 });
//               },
//               codeAutoRetrievalTimeout: (verificationId) async {},
//             );
//           },
//           child: Text("SEND"),
//           color: Colors.blue,
//           textColor: Colors.white,
//         ),
//         Spacer(),
//       ],
//     );
//   }
//
//   getOtpFormWidget(context) {
//     return Column(
//       children: [
//         Spacer(),
//         TextField(
//           controller: otpController,
//           decoration: InputDecoration(
//             hintText: "Enter OTP",
//           ),
//         ),
//         SizedBox(
//           height: 16,
//         ),
//         FlatButton(
//           onPressed: () async {
//             PhoneAuthCredential phoneAuthCredential =
//             PhoneAuthProvider.credential(
//                 verificationId: verificationId, smsCode: otpController.text);
//
//             signInWithPhoneAuthCredential(phoneAuthCredential);
//           },
//           child: Text("VERIFY"),
//           color: Colors.blue,
//           textColor: Colors.white,
//         ),
//         Spacer(),
//       ],
//     );
//   }
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
//   @override
//   Widget loading(BuildContext context) {
//     return Scaffold(
//         key: _scaffoldKey,
//         body: Container(
//           child: showLoading
//               ? Center(
//             child: CircularProgressIndicator(),
//           )
//               : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
//               ? getMobileFormWidget(context)
//               : getOtpFormWidget(context),
//           padding: const EdgeInsets.all(16),
//         ));
//   }
// }

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class SigninOrSignupScreen extends StatefulWidget {
  @override
  _SigninOrSignupScreenState createState() => _SigninOrSignupScreenState();
}

class _SigninOrSignupScreenState extends State<SigninOrSignupScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  late String verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Have a snack!')),
      );
    }
  }

  getMobileFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        TextField(
          controller: phoneController,
          decoration: InputDecoration(
            hintText: "Phone Number",
          ),
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () async {
            setState(() {
              showLoading = true;
            });

            await _auth.verifyPhoneNumber(
              phoneNumber: phoneController.text,
              verificationCompleted: (phoneAuthCredential) async {
                setState(() {
                  showLoading = false;
                });
                signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              verificationFailed: (verificationFailed) async {
                setState(() {
                  showLoading = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('error')),
                );
              },
              codeSent: (verificationId, resendingToken) async {
                setState(() {
                  showLoading = false;
                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {},
            );
          },
          child: Text("SEND"),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        TextField(
          controller: otpController,
          decoration: InputDecoration(
            hintText: "Enter OTP",
          ),
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: Text("VERIFY"),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: Container(
          child: showLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
          padding: const EdgeInsets.all(16),
        ));
  }
}
