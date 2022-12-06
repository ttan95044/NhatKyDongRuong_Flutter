import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nhatkydongruong/build/navbar.dart';
import 'package:nhatkydongruong/page/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../build/button.dart';
import '../build/contrast.dart';

final usersRef = FirebaseFirestore.instance.collection('users');

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const String id = 'login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('lib/asset/img/logo.png'),
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Nhập Email',
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.green[800], //<-- SEE HERE
                ),
              ),

            ),
            const SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Nhập Mật Khẩu',
                labelText: 'Mặt khẩu',
                labelStyle: TextStyle(
                  color: Colors.green[800], //<-- SEE HERE
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Đăng Nhập',
              colour: Colors.green,
              onPressed: () async {
                setState(() {
                  showSpinner = true;
                });
                try {
                  final users = await _auth.signInWithEmailAndPassword(
                      email: email!, password: password!);
                  if (users != null) {
                    SharedPreferences preferences = await SharedPreferences.getInstance();
                    preferences.setString('email', emailController.text);
                    Navigator.pushNamed(context, navBar.id);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Đăng nhập thành công !!!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'NotoSerif'
                        ),)));
                  }
                  setState(() {
                    showSpinner = false;
                  });
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Sai tài khoản hoặc mật khẩu !!!',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontFamily: 'NotoSerif'
                      ),)));
                  print(e);
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Bạn chưa có tài khoản?"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()));
                  },
                  child: const Text(
                    "Đăng Ký",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

