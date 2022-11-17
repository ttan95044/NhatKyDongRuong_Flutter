import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../build/contrast.dart';

final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class addUseFertilizer extends StatefulWidget {
  final String id;
  const addUseFertilizer({Key? key, required this.id}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
    );
  }

  @override
  State<addUseFertilizer> createState() => _addUseFertilizerState();
}

class _addUseFertilizerState extends State<addUseFertilizer> {
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  String? messageText;
  String? time,congviec,thuoc,phanbon;


  final _formKey = GlobalKey<FormState>();

  final timeEditingController = new TextEditingController();
  final congviecEditingController = new TextEditingController();
  final thuocEditingController = new TextEditingController();
  final phanbonEditingController = new TextEditingController();



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


    final timebt = TextFormField(
      textAlign: TextAlign.center,
      controller: timeEditingController,
      validator: (value) => ((value?.length ?? 0) < 1
          ? 'Không Được Để Trống.'
          : null),
      keyboardType: TextInputType.text,
      onChanged: (value) {
        time = value.toString();
      },
      textInputAction: TextInputAction.next,
      decoration: kTextFieldDecoration.copyWith(
        hintText: 'VD: 12/2/2022... ',
        labelText: 'Thời gian ghi nhận',
        labelStyle: TextStyle(
          color: Colors.green[700], //<-- SEE HERE
        ),
      ),
    );


    final congviecbt = TextFormField(
      textAlign: TextAlign.center,
      controller: congviecEditingController,
      validator: (value) => ((value?.length ?? 0) < 1
          ? 'Không Được Để Trống.'
          : null),
      keyboardType: TextInputType.text,
      onChanged: (value) {
        congviec = value.toString();
      },
      textInputAction: TextInputAction.next,
      decoration: kTextFieldDecoration.copyWith(
        hintText: "VD: Bón phân, tưới thuốc, tưới nước...",
        labelText: 'Công việc',
        labelStyle: TextStyle(
          color: Colors.green[700], //<-- SEE HERE
        ),
      ),
    );

    final thuocbt = TextFormField(
      textAlign: TextAlign.center,
      controller: thuocEditingController,
      validator: (value) => ((value?.length ?? 0) < 1
          ? 'Không Được Để Trống.'
          : null),
      keyboardType: TextInputType.text,
      onChanged: (value) {
        thuoc = value.toString();
      },
      textInputAction: TextInputAction.next,
      decoration: kTextFieldDecoration.copyWith(
        hintText: "VD: Comcat 2 gói,...",
        labelText: 'Thuốc đã dùng và liều lượng',
        labelStyle: TextStyle(
          color: Colors.green[700], //<-- SEE HERE
        ),
      ),
    );

    final phanbonbt = TextFormField(
      textAlign: TextAlign.center,
      controller: phanbonEditingController,
      validator: (value) => ((value?.length ?? 0) < 1
          ? 'Không Được Để Trống.'
          : null),
      keyboardType: TextInputType.text,
      onChanged: (value) {
        phanbon= value.toString();
      },
      textInputAction: TextInputAction.next,
      decoration: kTextFieldDecoration.copyWith(
        hintText: "VD: 20-20-15 50kg...",
        labelText: 'Phân bón đã dùng và liều lượng',
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
            Addtime();
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
                    const Text('Ghi nhận thời gian',style: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                        fontFamily: 'NotoSerif'
                    ),),
                    timebt,
                    const SizedBox(height: 15),
                    const Text('Công việc',style: TextStyle(
                        fontSize: 35,
                        color: Colors.green,
                        fontFamily: 'NotoSerif'
                    ),),
                    congviecbt,
                    const SizedBox(height: 15),
                    const Text('Thuốc đã sử dụng',style: TextStyle(
                        fontSize: 35,
                        color: Colors.green,
                        fontFamily: 'NotoSerif'
                    ),),
                    const Text('Nếu không sử dụng ghi "Không"',style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontFamily: 'NotoSerif'
                    ),),
                    const SizedBox(height: 5),
                    thuocbt,
                    const SizedBox(height: 15),
                    const Text('Phân bón đã sử dụng',style: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                        fontFamily: 'NotoSerif'
                    ),),
                    const Text('Nếu không sử dụng ghi "Không"',style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontFamily: 'NotoSerif'
                    ),),
                    const SizedBox(height: 5),
                    phanbonbt,
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
  void Addtime() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      _firestore.collection('add').doc(widget.id).collection('addtime').doc().set({
        'timestamp': DateTime.now(),
        'email': loggedInUser.email,
        'time': time,
        'congviec': congviec,
        'thuoc': thuoc,
        'phanbon':phanbon,

      });
      EasyLoading.showSuccess('Add Successful!');
      Navigator.of(context).pop();
    } else {
      EasyLoading.showError('Can\'t Add Product!');
    }
  }
}

