import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nhatkydongruong/build/navbar.dart';
import 'package:nhatkydongruong/page/index.dart';
import 'package:nhatkydongruong/page/login.dart';
import 'package:nhatkydongruong/page/register.dart';
import 'package:nhatkydongruong/page/splash.dart';
import 'package:nhatkydongruong/page/suggestions.dart';
import 'package:nhatkydongruong/page_add_season/addSeason.dart';
import 'package:nhatkydongruong/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Nhatkydongruong());
}
class Nhatkydongruong extends StatelessWidget{
  const Nhatkydongruong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Splash.id,
      routes: {
        welcome.id: (context) => const welcome(),
        Login.id: (context) => const Login(),
        Register.id: (context) => const Register(),
        navBar.id: (context) => const navBar(),
        index.id: (context) => const index(),
        suggestions.id: (context) => const suggestions(),
        addSeason.id: (context) => const addSeason(),
        Splash.id: (context) => const Splash(),
      },
    );
  }
}