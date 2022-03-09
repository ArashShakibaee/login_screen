import 'package:flutter/material.dart';
import 'package:login_screen/constants.dart';
import 'package:login_screen/input_container.dart';
import 'package:persian_fonts/persian_fonts.dart';

void main() => runApp(const LoginScreen());

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(textTheme: PersianFonts.vazirTextTheme,unselectedWidgetColor: Colors.grey.shade400),
      home: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
          'images/background.jpg',
          fit: BoxFit.fill,
        )),
        Positioned(
            child: Container(
              height: size.height * 0.12,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                   Text('سامانه هاب فناوری سلامت',style: kAppbarTitleTextStyle),
                   Divider(color: Colors.red,indent: 128,endIndent: 16,thickness: 2,),
                   Divider(color: Colors.grey,indent: 32,endIndent: 16,thickness: 2,),
                ],
              ),
            )),
        Positioned(
            child: Center(
                child: Container(
          width: size.width * 0.7,
          height: size.height * 0.5,
          decoration: BoxDecoration(
              color: Colors.grey.shade300.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 256),
                    child:  InputContainer(),
                  ),
        ))),
      ],
    ));
  }
}
