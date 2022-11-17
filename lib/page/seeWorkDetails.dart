
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class seeWorkDetails extends StatefulWidget {
  seeWorkDetails({required this.documentSnapshot});
  DocumentSnapshot? documentSnapshot;

  @override
  State<seeWorkDetails> createState() => _seeWorkDetailsState();
}

class _seeWorkDetailsState extends State<seeWorkDetails> {
  final seasonTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? seasonText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print('Imformation of user: $user');
      }
    } catch (e) {
      print(e);
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back,size: 30,),
              onPressed: () {
                Navigator.of(context).pop();
              },
              tooltip: MaterialLocalizations
                  .of(context)
                  .openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.green[600],
        title: const Text('Chi tiết công việc',style: TextStyle(fontFamily: 'NotoSerif',fontSize: 22),),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("- Công việc: "+widget.documentSnapshot!['congviec'],
                style: const TextStyle(
                    fontSize: 23,
                    fontFamily: 'NotoSerif',height: 2
                ),
              ),
              const Divider(
                height: 20,
                thickness: 2,
                indent: 5,
                endIndent: 0,
                color: Colors.black,
              ),
              Text("- Thời gian ghi nhận: "+widget.documentSnapshot!['time'],
                style: const TextStyle(
                    fontSize: 23,
                    fontFamily: 'NotoSerif', height: 2
                ),
              ),
              const Divider(
                height: 20,
                thickness: 2,
                indent: 5,
                endIndent: 0,
                color: Colors.black,
              ),
              Text("- Thuốc và liều lượng dùng: "+widget.documentSnapshot!['thuoc'],
                style: const TextStyle(
                    fontSize: 23,
                    fontFamily: 'NotoSerif', height: 2
                ),
              ),
              const Divider(
                height: 20,
                thickness: 2,
                indent: 5,
                endIndent: 0,
                color: Colors.black,
              ),
              Text("- Phân bón và liệu lượng dùng: \n"+widget.documentSnapshot!['phanbon'],
                style: const TextStyle(
                    fontSize: 23,
                    fontFamily: 'NotoSerif', height: 2
                ),
              ),
              const Divider(
                height: 20,
                thickness: 2,
                indent: 5,
                endIndent: 0,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
