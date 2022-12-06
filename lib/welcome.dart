
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nhatkydongruong/page/login.dart';
import 'package:nhatkydongruong/page/register.dart';
import 'build/button.dart';

class welcome extends StatefulWidget{
  const welcome({Key? key}) :super(key: key);
  static const String id ='welcome';
  @override
  State<welcome> createState() => _WelComeState();
}

class _WelComeState extends State<welcome> with SingleTickerProviderStateMixin{
  AnimationController? controller;
  Animation? animation;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.green, end: Colors.white).animate(controller!);
    controller!.forward();
    controller!.addListener(() {
      setState(() {});
    });
  }
  @override
  void dispose(){
    controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/asset/img/logo1.png',),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              const CircleAvatar(
                radius: 100.0,
                backgroundImage: AssetImage('lib/asset/img/logo.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                  child: Center(child: Text('Nhật Ký Đồng Ruộng',style: TextStyle(fontFamily: 'NotoSerif')))
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              RoundedButton(
                title: 'Đăng Nhập',
                colour: Colors.green,
                onPressed: (){
                  Navigator.pushNamed(context, Login.id);
                },
              ),
              RoundedButton(
                title: 'Đăng Ký',
                colour: Colors.green[400],
                onPressed: (){
                  Navigator.pushNamed(context, Register.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

