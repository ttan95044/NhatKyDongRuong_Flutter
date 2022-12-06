import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nhatkydongruong/page/seeWorkDetails.dart';
import 'package:nhatkydongruong/page/ttseanson.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';


final _firestore = FirebaseFirestore.instance;

late User loggedInUser;

class seeWorkStream extends StatefulWidget {
  final String id;
  seeWorkStream({Key? key,required this.id}) : super(key: key);

  @override
  State<seeWorkStream> createState() => _seeWorkStreamState();
}

class _seeWorkStreamState extends State<seeWorkStream> {
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
  final TextEditingController _timeController = TextEditingController();

  final TextEditingController _congviecController = TextEditingController();

  final TextEditingController _thuocController = TextEditingController();

  final TextEditingController _phanbonController = TextEditingController();


  Future<void> _edit([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _timeController.text = documentSnapshot['time'];
      _congviecController.text = documentSnapshot['congviec'];
      _thuocController.text = documentSnapshot['thuoc'];
      _phanbonController.text = documentSnapshot['phanbon'];

    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Container(
            color: Colors.grey[300],
            child: Padding(
              padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _timeController,
                        decoration: const InputDecoration(
                            labelText: 'Chỉnh sửa thời gian ghi nhận',
                            labelStyle: TextStyle(fontSize: 25)
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller: _congviecController,
                        decoration: const InputDecoration(
                            labelText: 'Chỉnh sửa công việc',
                            labelStyle: TextStyle(fontSize: 25)
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller: _thuocController,
                        decoration: const InputDecoration(
                            labelText: 'Chỉnh sửa tên thuốc và liệu lượng',
                            labelStyle: TextStyle(fontSize: 25)
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller: _phanbonController,
                        decoration: const InputDecoration(
                            labelText: 'Chỉnh sửa tên phân bón và liệu lượng',
                            labelStyle: TextStyle(fontSize: 25)
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          child: const Text( 'Cập nhật',style: TextStyle(fontSize: 15),),
                          onPressed: () async {
                            final String time = _timeController.text;
                            final String congviec = _congviecController.text;
                            final String thuoc = _thuocController.text;
                            final String phanbon = _phanbonController.text;
                            await FirebaseFirestore.instance.collection('add').doc(widget.id).collection('addtime').doc(documentSnapshot!.id).update(
                                {
                                  "time": time,
                                  "congviec": congviec,
                                  "thuoc": thuoc,
                                  "phanbon": phanbon,
                                });
                            _timeController.text = '';
                            _congviecController.text = '';
                            _thuocController.text = '';
                            _phanbonController.text = '';
                            Navigator.of(context).pop();
                          }
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
  @override
  Future<void> _delete(String productId) async {
    await FirebaseFirestore.instance.collection('add').doc(widget.id).collection('addtime').doc(productId).delete();
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
        title: const Text('Những công việc',style: TextStyle(fontFamily: 'NotoSerif',fontSize: 22),),
      ),
      backgroundColor: Colors.grey[200],
      body: StreamBuilder<QuerySnapshot>(
          stream:
          _firestore.collection('add').doc(widget.id).collection('addtime').orderBy('timestamp').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
              );
            }return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, int index){
                  final DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                  return loggedInUser.email == documentSnapshot['email'] ?
                  GestureDetector(
                    onTap: () =>
                        Navigator.push(context, MaterialPageRoute(
                            builder: (_) =>
                                seeWorkDetails(documentSnapshot: documentSnapshot,)
                        )
                        ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 140,
                        width: 370,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [
                                Colors.blue,
                                Colors.green
                              ]
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 5,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Công việc: ' + documentSnapshot['congviec'],
                                    style: const TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontFamily: 'NotoSerif'
                                    ),),
                                  const SizedBox(height: 8,),
                                  Text('Thời gian: ' + documentSnapshot['time'],
                                    style: const TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontFamily: 'NotoSerif'
                                    ),),
                                  const SizedBox(height: 5),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width *0.85,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children:  [
                                        const SizedBox(width: 8,),
                                        GestureDetector(
                                          onTap: (){
                                            _edit(documentSnapshot);
                                          },
                                          child: const CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              FontAwesomeIcons.edit,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8,),
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (_) {
                                                  return AlertDialog(
                                                    title: Text("Xóa nhật ký?",style: TextStyle(fontFamily: 'NotoSerif'),),
                                                    content: Text("Bạn chắc chắn muốn xóa công việc?"),
                                                    actions: [
                                                      MaterialButton(onPressed: (){
                                                        Navigator.of(context).pop();
                                                      },child: Text('Không',style: TextStyle(fontSize: 17),),
                                                      ),
                                                      MaterialButton(onPressed: (){
                                                        _delete(documentSnapshot.id);
                                                        Navigator.of(context).pop();
                                                      },child: Text("Đồng ý",style: TextStyle(color: Colors.red,fontSize: 17),),
                                                      ),

                                                    ],
                                                  );
                                                }
                                            );
                                          },
                                          child: const CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              FontAwesomeIcons.trash,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ) : const SizedBox();
                }
            );
          }),
    );
  }
}


