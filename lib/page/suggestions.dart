import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../build/sidebar.dart';


late User loggedInUser;

class suggestions extends StatefulWidget {
  const suggestions({Key? key}) : super(key: key);
  static const String id = 'suggestions';
  @override
  State<suggestions> createState() => _suggestionsState();
}

class _suggestionsState extends State<suggestions> {


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        drawer: Sidebar(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Gợi Ý',style: TextStyle(fontFamily: 'NotoSerif',fontSize: 25),),
          backgroundColor: Colors.green,
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/asset/img/logo.png',),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
              )
          ),
        ),

      );
  }
}

