import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nhatkydongruong/page/ttseanson.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import '../build/sidebar.dart';


final _firestore = FirebaseFirestore.instance;

late User loggedInUser;

class index extends StatefulWidget {
  const index({Key? key}) : super(key: key);
  static const String id = 'index';

  @override
  State<index> createState() => _indexState();
}

class _indexState extends State<index> {
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
    return Container(
      child: Scaffold(
        drawer: Sidebar(),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Nhật Ký Đồng Ruộng',style: TextStyle(fontFamily: 'NotoSerif',fontSize: 25),),
        ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/asset/img/hinhanh.jpg',),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
                )
            ),
            child: IndexStream()
        ),
      ),
    );
  }
}

class IndexStream extends StatefulWidget {
  const IndexStream({Key? key}) : super(key: key);

  @override
  State<IndexStream> createState() => _IndexStreamState();
}

class _IndexStreamState extends State<IndexStream> {
  final TextEditingController _muaController = TextEditingController();

  final TextEditingController _namController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _soluonghaController = TextEditingController();

  final TextEditingController _diachiController = TextEditingController();

  final TextEditingController _loaicaytrongController = TextEditingController();

  final TextEditingController _soluonggiongController = TextEditingController();

  final TextEditingController _soluonghagiongController = TextEditingController();

  final TextEditingController _ngayxuonggiongController = TextEditingController();

  final TextEditingController _xulygiongController = TextEditingController();

  final TextEditingController _nameloaithuocController = TextEditingController();

  final TextEditingController _nameloaiphanbonController = TextEditingController();

  final TextEditingController _timetuoinuocController = TextEditingController();

  final TextEditingController _dophController = TextEditingController();

  final TextEditingController _timedukienthuhoachController = TextEditingController();

  final CollectionReference _add =
  FirebaseFirestore.instance.collection('add');

  Future<void> _edit([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _muaController.text = documentSnapshot['mua'];
      _namController.text = documentSnapshot['nam'];
      _nameController.text = documentSnapshot['name'];
      _soluonghaController.text = documentSnapshot['soluongha'];
      _diachiController.text = documentSnapshot['diachi'];
      _loaicaytrongController.text = documentSnapshot['loaicaytrong'];
      _soluonggiongController.text = documentSnapshot['soluonggiong'];
      _soluonghagiongController.text = documentSnapshot['soluonghagiong'];
      _ngayxuonggiongController.text = documentSnapshot['ngayxuonggiong'];
      _xulygiongController.text = documentSnapshot['xulygiong'];
      _timetuoinuocController.text = documentSnapshot['timetuoinuoc'];
      _dophController.text = documentSnapshot['doph'];

    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Container(
            color: Colors.grey[200],
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
                        controller: _muaController,
                        decoration: const InputDecoration(
                            labelText: 'Chỉnh sửa mùa vụ',
                            labelStyle: TextStyle(fontSize: 25)
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller: _namController,
                        decoration: const InputDecoration(
                            labelText: 'Chỉnh sửa năm trồng',
                            labelStyle: TextStyle(fontSize: 25)
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            labelText: 'Chỉnh sửa tên chủ hộ',
                            labelStyle: TextStyle(fontSize: 25)
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller: _soluonghaController,
                        decoration: const InputDecoration(
                            labelText: 'Chỉnh sửa số lượng hecta đất',
                            labelStyle: TextStyle(fontSize: 25)
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller: _diachiController,
                        decoration: const InputDecoration(
                            labelText: 'Chỉnh sửa địa chỉ',
                            labelStyle: TextStyle(fontSize: 25)
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller: _loaicaytrongController,
                        decoration: const InputDecoration(
                            labelText: 'Chỉnh sửa tên loại cây trồng',
                            labelStyle: TextStyle(fontSize: 25)
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller: _soluonggiongController,
                        decoration: const InputDecoration(
                            labelText: 'Chỉnh sửa số lượng giống',
                            labelStyle: TextStyle(fontSize: 25)
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller: _soluonghagiongController,
                        decoration: const InputDecoration(
                            labelText: 'Chỉnh sửa số lượng giống/Ha',
                            labelStyle: TextStyle(fontSize: 25)
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller: _ngayxuonggiongController,
                        decoration: const InputDecoration(
                            labelText: 'Chỉnh sửa ngày xuống giống',
                            labelStyle: TextStyle(fontSize: 25)
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller: _xulygiongController,
                        decoration: const InputDecoration(
                            labelText: 'Chỉnh sửa ngày xử lý giống',
                            labelStyle: TextStyle(fontSize: 25)
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller: _timetuoinuocController,
                        decoration: const InputDecoration(
                            labelText: 'Chỉnh sửa chu kỳ tưới nước',
                            labelStyle: TextStyle(fontSize: 25)
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller: _dophController,
                        decoration: const InputDecoration(
                            labelText: 'Chỉnh sửa độ pH của đật',
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
                            final String mua = _muaController.text;
                            final String nam = _namController.text;
                            final String name = _nameController.text;
                            final String soluongha = _soluonghaController.text;
                            final String diachi = _diachiController.text;
                            final String loaicaytrong = _loaicaytrongController.text;
                            final String soluonggiong = _soluonggiongController.text;
                            final String soluonghagiong = _soluonghagiongController.text;
                            final String ngayxuonggiong = _ngayxuonggiongController.text;
                            final String xulygiong = _xulygiongController.text;
                            final String timetuoinuoc = _timetuoinuocController.text;
                            final String doph = _dophController.text;
                            await _add.doc(documentSnapshot!.id).update(
                                {
                                  "mua": mua,
                                  "nam": nam,
                                  "name": name,
                                  "soluongha": soluongha,
                                  "diachi": diachi,
                                  "loaicaytrong": loaicaytrong,
                                  "soluonggiong": soluonggiong,
                                  "soluonghagiong": soluonghagiong,
                                  "ngayxuonggiong": ngayxuonggiong,
                                  "xulygiong": xulygiong,
                                  "timetuoinuoc": timetuoinuoc,
                                  "doph": doph,
                                });
                            _muaController.text = '';
                            _namController.text = '';
                            _nameController.text = '';
                            _soluonghaController.text = '';
                            _diachiController.text = '';
                            _loaicaytrongController.text = '';
                            _soluonggiongController.text = '';
                            _soluonghagiongController.text = '';
                            _ngayxuonggiongController.text = '';
                            _xulygiongController.text = '';
                            _timetuoinuocController.text = '';
                            _dophController.text = '';
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
  Future<void> _adddrugs([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameloaithuocController.text = documentSnapshot['nameloaithuoc'];
      _nameloaiphanbonController.text = documentSnapshot['nameloaiphanbon'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Container(
            color: Colors.grey[200],
            child: Padding(
              padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _nameloaithuocController,
                      decoration: const InputDecoration(
                          labelText: 'Thêm những loại thuốc đã sử dụng',
                          labelStyle: TextStyle(fontSize: 25)
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                    TextField(
                      controller: _nameloaiphanbonController,
                      decoration: const InputDecoration(
                          labelText: 'Thêm những loại phân đã bón sử dụng',
                          labelStyle: TextStyle(fontSize: 25)
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        child: const Text( 'Thêm',style: TextStyle(fontSize: 15),),
                        onPressed: () async {
                          final String nameloaithuoc = _nameloaithuocController.text;
                          final String nameloaiphanbon = _nameloaiphanbonController.text;
                          await _add.doc(documentSnapshot!.id).update(
                              {
                                "nameloaithuoc": nameloaithuoc,
                                "nameloaiphanbon": nameloaiphanbon,
                              });
                          _nameloaithuocController.text = '';
                          _nameloaiphanbonController.text = '';
                          Navigator.of(context).pop();
                        }
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
  @override
  Future<void> _delete(String productId) async {
    await _add.doc(productId).delete();

  }

  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:
        _firestore.collection('add').orderBy('timestamp').snapshots(),
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
                              ttSeanson(documentSnapshot: documentSnapshot,)
                      )
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 180,
                      width: 370,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.green,
                            Colors.black26
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
                                Text('Năm: ' + documentSnapshot['nam'],
                                  style: const TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontFamily: 'NotoSerif'
                                  ),),
                                const SizedBox(height: 8,),
                                Text('Mùa vụ: ' + documentSnapshot['mua'],
                                  style: const TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontFamily: 'NotoSerif'
                                  ),),
                                const SizedBox(height: 8,),
                                Text('Loại cây trồng: ' +documentSnapshot['loaicaytrong'],
                                  style: const TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontFamily: 'NotoSerif'
                                  ),
                                ),
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
                                          backgroundColor: Colors.lightGreen,
                                          child: Icon(
                                            FontAwesomeIcons.edit,
                                            color: Colors.white,
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
                                                  content: Text("Bạn chắc chắn muốn xóa nhật ký?"),
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
                                          backgroundColor: Colors.lightGreen,
                                          child: Icon(
                                            FontAwesomeIcons.trash,
                                            color: Colors.white,
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
        });
    }
}


