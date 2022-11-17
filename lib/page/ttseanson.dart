
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nhatkydongruong/page/seeWork.dart';
import 'package:nhatkydongruong/page_add_season/addUseFertilizer.dart';


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
        title: const Text('Thông tin mùa vụ',style: TextStyle(fontFamily: 'NotoSerif',fontSize: 22),),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.green,
                child: MaterialButton(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => addUseFertilizer(id: widget.documentSnapshot!['id'],)));
                    },
                    child: const Text(
                      "Thêm những công việc &""\nThời gian ghi nhận sử dụng""\nThuốc và phân bón",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'NotoSerif'),
                    )),
              ),
              const Divider(
                height: 20,
                thickness: 2,
                indent: 5,
                endIndent: 0,
                color: Colors.black,
              ),
              Container(
                color: Colors.blue,
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => seeWorkStream(id: widget.documentSnapshot!.id)));
                  },
                  child: const Text(
                    "Xem chi tiết những công việc",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'NotoSerif'),
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
              Text("- Mùa vụ: "+widget.documentSnapshot!['mua'],
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
              Text("- Năm trồng: "+widget.documentSnapshot!['nam'],
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
              Text("- Tên chủ hộ: "+widget.documentSnapshot!['name'],
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
              Text("- Độ pH của đất: "+widget.documentSnapshot!['nam'],
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
