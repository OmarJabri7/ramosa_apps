import 'package:flutter/material.dart';
import 'package:ramosa_apps/main.dart';
import 'package:flutter/widgets.dart';
import 'dart:developer';
// import 'package:google_sign_in/google_sign_in.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: [
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ],
// );

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  LoginState createState() => LoginState();
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class SizeConfig {
  MediaQueryData _mediaQueryData = MediaQueryData();
  double screenWidth = 0;
  double screenHeight = 0;
  double blockSizeHorizontal = 0;
  double blockSizeVertical = 0;
  double _safeAreaHorizontal = 0;
  double _safeAreaVertical = 0;
  double safeBlockHorizontal = 0;
  double safeBlockVertical = 0;

  SizeConfig(BuildContext context) {
    this._mediaQueryData = MediaQuery.of(context);
    this.screenWidth = this._mediaQueryData.size.width;
    this.screenHeight = this._mediaQueryData.size.height;
    this.blockSizeHorizontal = this.screenWidth / 100;
    this.blockSizeVertical = this.screenHeight / 100;
    this._safeAreaHorizontal =
        this._mediaQueryData.padding.left + this._mediaQueryData.padding.right;
    this._safeAreaVertical =
        this._mediaQueryData.padding.top + this._mediaQueryData.padding.bottom;
    this.safeBlockHorizontal =
        (this.screenWidth - this._safeAreaHorizontal) / 100;
    this.safeBlockVertical = (this.screenHeight - this._safeAreaVertical) / 100;
  }
}

// Future<void> _handleSignIn() async {
//   try {
//     await _googleSignIn.signIn();
//   } catch (error) {
//     print(error);
//   }
// }

Scaffold body(BuildContext context) {
  int vertSize = 17;
  int size = 50;
  SizeConfig sc = SizeConfig(context);
  debugPrint(sc.safeBlockVertical.toString());
  MediaQueryData queryData;
  queryData = MediaQuery.of(context);
  final Color bg1 = HexColor.fromHex('#F2D8CB');
  final Color border = Colors.pink;
  return Scaffold(
    backgroundColor: bg1,
    appBar: null,
    body: SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Center(
              child: Container(
            height: sc.safeBlockVertical * 40, //10 for example
            width: sc.safeBlockHorizontal * size,
            // child: Image.asset("assets/images/white.jpeg"),
          )),
        ),
        Container(
          height: sc.safeBlockVertical * 10, //10 for example
          width: sc.safeBlockHorizontal * 400,
          color: bg1,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: TextField(
            decoration: InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: border)),
                labelText: 'Username',
                hintText: 'Enter your username.'),
          ),
        ),
        // const Spacer(
        //   flex: 10,
        // ),
        Container(
          height: sc.safeBlockVertical * 10, //10 for example
          width: sc.safeBlockHorizontal * 400,
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: border)),
                labelText: 'Password',
                hintText: 'Enter your password.'),
          ),
        ),
        TextButton(
          onPressed: () {
            //TODO FORGOT PASSWORD SCREEN GOES HERE
          },
          child: const Text(
            'Forgot Password',
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
        Container(
          height: sc.safeBlockVertical * 5, //10 for example
          width: sc.safeBlockHorizontal * 80,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              // _handleSignIn();
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (_) => Ramosa()));
            },
            child: const Text(
              "Log In",
            ),
          ),
        )
      ]),
    ),
  );
}

class LoginState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return body(context);
  }
}
