import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nhatkydongruong/welcome.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../build/navbar.dart';

String? finalEmail;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static const String id ='splash';
  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {

  void initState(){
    getValidationDate().whenComplete(() async {
    });
    super.initState();
  }
  Future getValidationDate() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var get = sharedPreferences.getString('email');
    setState(() {
      finalEmail = get;
    });
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 2500,
      splash: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/asset/img/hinhanh2.jpg',),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
            )
        ),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        FadeAnimatedText('Nhật Ký ',
                            textStyle: const TextStyle(fontFamily: 'NotoSerif',fontSize: 30),
                            duration: const Duration(milliseconds: 1200)
                        ),
                        FadeAnimatedText('Nhật Ký Đồng Ruộng',
                            textStyle: const TextStyle(fontFamily: 'NotoSerif',fontSize: 30),
                            duration: const Duration(milliseconds: 1200)
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      nextScreen: finalEmail == null ? welcome() : navBar(),
      // nextScreen: Login(),
    );
  }
}