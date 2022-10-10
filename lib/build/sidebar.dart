import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nhatkydongruong/page_add_season/addSeason.dart';
import 'package:nhatkydongruong/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../page/user_model.dart';


late User loggedInUser;

class Sidebar extends StatefulWidget {
  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();

  @override

  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
      backgroundColor: Colors.grey[800],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName:
              Text("${loggedInUser.secondName} ${loggedInUser.firstName}",
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'NotoSerif'
                  )),
              accountEmail:
              Text("${loggedInUser.email}",
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'NotoSerif'
                  )),
              decoration: const BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                image: AssetImage('lib/asset/img/hinhanh4.jpg'),
                fit: BoxFit.cover
              )
            ),
            ),
            ListTile(
              textColor: Colors.white,
              leading: const Icon(Icons.add,size: 35,color: Colors.white,),
              title: const Text('Thêm nhật ký đồng ruộng',
                style: TextStyle(fontSize: 16,fontFamily: 'NotoSerif'),),
              onTap: (){
                Navigator.pushNamed(context, addSeason.id);
              },
            ),
            const Divider(color: Colors.white,),
            ListTile(
              textColor: Colors.white,
              leading: Icon(Icons.exit_to_app,size: 30,color: Colors.white,),
              title: Text('Đăng xuất',
                style: TextStyle(fontSize: 17,fontFamily: 'NotoSerif'),),
              onTap: () async {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text("Đăng xuất tài khoản?",style: TextStyle(fontFamily: 'NotoSerif'),),
                        content: Text("Bạn chắc chắn muốn đăng xuất"),
                        actions: [
                          FlatButton(onPressed: (){
                            Navigator.of(context).pop();
                          },child: Text('Không',style: TextStyle(fontSize: 17),),
                          ),
                          FlatButton(onPressed: () async {
                            final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                            sharedPreferences.remove('email');
                            Navigator.pushNamed(context, welcome.id);
                            Navigator.of(context).pop();
                          },child: Text("Đăng xuất",style: TextStyle(color: Colors.red,fontSize: 17),),
                          ),

                        ],
                      );
                    }
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


