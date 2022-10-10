
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class ttSeanson extends StatefulWidget {
  ttSeanson({required this.documentSnapshot});
  DocumentSnapshot? documentSnapshot;

  @override
  State<ttSeanson> createState() => _ttSeansonState();
}

class _ttSeansonState extends State<ttSeanson> {
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
        title: const Text('Thông tin những mùa vụ',style: TextStyle(fontFamily: 'NotoSerif',fontSize: 22),),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text("- Mùa vụ: "+widget.documentSnapshot!['mua'],
                  style: const TextStyle(
                    fontSize: 23,
                    fontFamily: 'NotoSerif',height: 2
                  ),
                ),
              ),
              const Divider(
                height: 20,
                thickness: 2,
                indent: 5,
                endIndent: 0,
                color: Colors.black,
              ),
              Container(
                child: Text("- Năm trồng: "+widget.documentSnapshot!['nam'],
                  style: const TextStyle(
                      fontSize: 23,
                      fontFamily: 'NotoSerif', height: 2
                  ),
                ),
              ),
              const Divider(
                height: 20,
                thickness: 2,
                indent: 5,
                endIndent: 0,
                color: Colors.black,
              ),
              Container(
                child: Text("- Tên chủ hộ: "+widget.documentSnapshot!['name'],
                  style: const TextStyle(
                      fontSize: 23,
                      fontFamily: 'NotoSerif', height: 2
                  ),
                ),
              ),
              const Divider(
                height: 20,
                thickness: 2,
                indent: 5,
                endIndent: 0,
                color: Colors.black,
              ),
              Text("- Số Hecta đất: "+widget.documentSnapshot!['soluongha'],
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
              Text("- Địa chỉ: "+ widget.documentSnapshot!['diachi'],
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
              Text("- Tên loại cây trồng: "+widget.documentSnapshot!['loaicaytrong'],
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
              Text("- Số lượng giống: "+widget.documentSnapshot!['soluonggiong'],
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
              Text("- Số lượng giống/Hecta: \n""\  "+widget.documentSnapshot!['soluonghagiong'],
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
              Text("- Ngày xuống giống: "+widget.documentSnapshot!['ngayxuonggiong'],
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
              Text("- Ngày xử lý giống: "+ widget.documentSnapshot!['xulygiong'],
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
              Text("- Loại thuốc đã sử dụng: \n""\ + "+ widget.documentSnapshot!['nameloaithuoc'],
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
              Text("- Loại phân bón đã sử dụng: \n""\ + "+widget.documentSnapshot!['nameloaiphanbon'],
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
              Text("- Chu kỳ tưới nước: "+widget.documentSnapshot!['timetuoinuoc'],
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
              Text("- Độ pH của đất: "+widget.documentSnapshot!['doph'],
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
              Text("- Thời gian dự kiến thu hoạch: ""\n -> "+widget.documentSnapshot!['timedukienthuhoach'],
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
