
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nhatkydongruong/build/navbar.dart';
import '../build/contrast.dart';

final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class addSeason extends StatefulWidget {
  const addSeason({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
    );
  }

  static const String id = 'addseason';

  @override
  State<addSeason> createState() => _addSeasonState();
}

class _addSeasonState extends State<addSeason> {
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  String? messageText;
  String? mua,nam,name,loaicaytrong,sohacaytrong,diachi,soluongha;
  String? ngayxuonggiong,soluonggiong,soluonghagiong,xulygiong;
  String? timetuoinuoc;
  String? doph,id;

  final _formKey = GlobalKey<FormState>();
  //mua vu
  final muaEditingController = new TextEditingController();
  final namEditingController = new TextEditingController();
  final nameEditingController = new TextEditingController();
  final soluonghaEditingController = new TextEditingController();
  final diachiEditingController = new TextEditingController();
  //cay trong
  final loaicaytrongEditingController = new TextEditingController();
  final soluonghagiongEditingController = new TextEditingController();
  final ngayxuonggiongEditingController = new TextEditingController();
  final soluonggiongEditingController = new TextEditingController();
  final xulygiongEditingController = new TextEditingController();
  final timetuoinuocEditingController = new TextEditingController();
  final dophEditingController = new TextEditingController();



  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print('User: $user');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {


    final muabt = TextFormField(
      textAlign: TextAlign.center,
        controller: muaEditingController,
        validator: (value) => ((value?.length ?? 0) < 1
            ? 'Không Được Để Trống.'
            : null),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          mua = value.toString();
        },
        textInputAction: TextInputAction.next,
        decoration: kTextFieldDecoration.copyWith(
        hintText: 'VD: Đông-Xuân... ',
        labelText: 'Mùa vụ',
        labelStyle: TextStyle(
          color: Colors.green[700], //<-- SEE HERE
          ),
        ),
      );


    final nambt = TextFormField(
        textAlign: TextAlign.center,
        controller: namEditingController,
        validator: (value) => ((value?.length ?? 0) < 1
            ? 'Không Được Để Trống.'
            : null),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          nam = value.toString();
        },
        textInputAction: TextInputAction.next,
        decoration: kTextFieldDecoration.copyWith(
          hintText: "VD: 2022...",
          labelText: 'Năm trồng',
          labelStyle: TextStyle(
            color: Colors.green[700], //<-- SEE HERE
          ),
        ),
    );

    final namebt = TextFormField(
        textAlign: TextAlign.center,
        controller: nameEditingController,
        validator: (value) => ((value?.length ?? 0) < 1
            ? 'Không Được Để Trống.'
            : null),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          name = value.toString();
        },
        textInputAction: TextInputAction.next,
        decoration: kTextFieldDecoration.copyWith(
          hintText: "VD: Trần Văn A...",
          labelText: 'Tên chủ hộ',
          labelStyle: TextStyle(
            color: Colors.green[700], //<-- SEE HERE
          ),
        ),
        );

    final soluonghabt = TextFormField(
        textAlign: TextAlign.center,
        controller: soluonghaEditingController,
        validator: (value) => ((value?.length ?? 0) < 1
            ? 'Không Được Để Trống.'
            : null),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          soluongha= value.toString();
        },
        textInputAction: TextInputAction.next,
        decoration: kTextFieldDecoration.copyWith(
          hintText: "VD: 10Ha...",
          labelText: 'Số lượng Hecta đất',
          labelStyle: TextStyle(
            color: Colors.green[700], //<-- SEE HERE
          ),
        ),
        );


    final diachibt = TextFormField(
      textAlign: TextAlign.center,
      controller: diachiEditingController,
      validator: (value) => ((value?.length ?? 0) < 1
          ? 'Không Được Để Trống.'
          : null),
      keyboardType: TextInputType.text,
      onChanged: (value) {
        diachi = value.toString();
      },
      textInputAction: TextInputAction.next,
      decoration: kTextFieldDecoration.copyWith(
        hintText: "VD: Tân an thanh,Bình Tân,Vĩnh Long....",
        labelText: 'Địa chỉ',
        labelStyle: TextStyle(
          color: Colors.green[700], //<-- SEE HERE
        ),
      ),
    );


    final loaicaytrongbt = TextFormField(
        textAlign: TextAlign.center,
        controller: loaicaytrongEditingController,
        validator: (value) => ((value?.length ?? 0) < 1
            ? 'Không Được Để Trống.'
            : null),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          loaicaytrong = value.toString();
        },
        textInputAction: TextInputAction.next,
        decoration: kTextFieldDecoration.copyWith(
          hintText: "VD: Lúa,.....",
          labelText: 'Tên loại cây trồng',
          labelStyle: TextStyle(
            color: Colors.green[700], //<-- SEE HERE
          ),
        ),
        );


    final soluonggiongbt = TextFormField(
      textAlign: TextAlign.center,
      controller: soluonggiongEditingController,
      validator: (value) => ((value?.length ?? 0) < 1
          ? 'Không Được Để Trống.'
          : null),
      keyboardType: TextInputType.text,
      onChanged: (value) {
        soluonggiong = value.toString();
      },
      textInputAction: TextInputAction.next,
      decoration: kTextFieldDecoration.copyWith(
        hintText: "VD: 100KG Lúa,....",
        labelText: 'Số lượng giống',
        labelStyle: TextStyle(
          color: Colors.green[700], //<-- SEE HERE
        ),
      ),
    );

    final soluonghagiongbt = TextFormField(
        textAlign: TextAlign.center,
        controller: soluonghagiongEditingController,
        validator: (value) => ((value?.length ?? 0) < 1
            ? 'Không Được Để Trống.'
            : null),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          soluonghagiong= value.toString();
        },
        textInputAction: TextInputAction.next,
        decoration: kTextFieldDecoration.copyWith(
          hintText: "VD: 20KG/Ha, 200 Cây/Ha....",
          labelText: 'Số Lượng Giống/HA Đất',
          labelStyle: TextStyle(
            color: Colors.green[700], //<-- SEE HERE
          ),
        ),
        );

    final ngayxuonggiongbt = TextFormField(
      textAlign: TextAlign.center,
      controller: ngayxuonggiongEditingController,
      validator: (value) => ((value?.length ?? 0) < 1
          ? 'Không Được Để Trống.'
          : null),
      keyboardType: TextInputType.text,
      onChanged: (value) {
        ngayxuonggiong = value.toString();
      },
      textInputAction: TextInputAction.next,
      decoration: kTextFieldDecoration.copyWith(
        hintText: "VD: 20/11/2022...",
        labelText: 'Ngày xuống giống',
        labelStyle: TextStyle(
          color: Colors.green[700], //<-- SEE HERE
        ),
      ),
    );

    final xulygiongbt = TextFormField(
        textAlign: TextAlign.center,
        controller: xulygiongEditingController,
        validator: (value) => ((value?.length ?? 0) < 1
            ? 'Không Được Để Trống.'
            : null),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          xulygiong= value.toString();
        },
        textInputAction: TextInputAction.next,
        decoration: kTextFieldDecoration.copyWith(
          hintText: "VD: 22/10/2022....",
          labelText: 'Ngày xữ lý giống',
          labelStyle: TextStyle(
            color: Colors.green[700], //<-- SEE HERE
          ),
        ),
        );

    final timetuoinuocbt = TextFormField(
        textAlign: TextAlign.center,
        controller: timetuoinuocEditingController,
        validator: (value) => ((value?.length ?? 0) < 1
            ? 'Không Được Để Trống.'
            : null),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          timetuoinuoc= value.toString();
        },
        textInputAction: TextInputAction.next,
        decoration: kTextFieldDecoration.copyWith(
          hintText: "VD: 1 lần/ngày...",
          labelText: "Chu kỳ tưới nước",
          labelStyle: TextStyle(
            color: Colors.green[700], //<-- SEE HERE
          ),
        ),
    );

    final dophbt = TextFormField(
        textAlign: TextAlign.center,
        controller: dophEditingController,
        validator: (value) => ((value?.length ?? 0) < 1
            ? 'Không Được Để Trống.'
            : null),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          doph= value.toString();
        },
        textInputAction: TextInputAction.next,
        decoration: kTextFieldDecoration.copyWith(
          hintText: "VD: 5pH",
          labelText: "Độ pH của đất",
          labelStyle: TextStyle(
            color: Colors.green[700], //<-- SEE HERE
          ),
        ),
    );



    //add button
    final addButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.green,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Add();
          },
          child: const Text(
            "Lưu",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'NotoSerif'),
          )),
    );
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text('Mùa Vụ',style: TextStyle(
                      fontSize: 35,
                      color: Colors.green,
                      fontFamily: 'NotoSerif'
                    ),),
                    const SizedBox(height: 15),
                    muabt,
                    const SizedBox(height: 15),
                    nambt,
                    const SizedBox(height: 15),
                    namebt,
                    const SizedBox(height: 15),
                    soluonghabt,
                    const SizedBox(height: 15),
                    diachibt,
                    const SizedBox(height: 15),
                    const Text('Cây Trồng',style:  TextStyle(
                      fontSize: 35,
                      color: Colors.green,
                      fontFamily: 'NotoSerif'
                    ),),
                    const SizedBox(height: 15),
                    loaicaytrongbt,
                    const SizedBox(height: 15),
                    soluonggiongbt,
                    const SizedBox(height: 15),
                    soluonghagiongbt,
                    const SizedBox(height: 15),
                    ngayxuonggiongbt,
                    const SizedBox(height: 15),
                    xulygiongbt,
                    const SizedBox(height: 15),
                    timetuoinuocbt,
                    const SizedBox(height: 15),
                    dophbt,
                    const SizedBox(height: 15),
                    const SizedBox(height: 15),
                    addButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void Add() {
    id = _firestore.collection('add').doc().id;
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      _firestore.collection('add').doc(id).set({
        'id': id ,
        'timestamp': DateTime.now(),
        'email': loggedInUser.email,
        'mua': mua,
        'nam':nam,
        'name': name,
        'soluongha':soluongha,
        'diachi':diachi,
        'loaicaytrong':loaicaytrong,
        'soluonghagiong':soluonghagiong,
        'ngayxuonggiong':ngayxuonggiong,
        'soluonggiong':soluonggiong,
        'xulygiong':xulygiong,
        'timetuoinuoc':timetuoinuoc,
        'doph':doph,

      });
      EasyLoading.showSuccess('Add Successful!');
      Navigator.pushNamed(context, navBar.id);
    } else {
      EasyLoading.showError('Can\'t Add Product!');
    }
  }
}

