import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/fire/ChatRoom.dart';
import 'package:flutter_try/fire/chat.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:provider/provider.dart';

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> with WidgetsBindingObserver {
  Map<String, dynamic>? userMap;
  Map<String, dynamic>? storeMap;
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var store;
  var sizee;
  var inn;


  @override
  void initState() {
    super.initState();
    onSearch(1);
    WidgetsBinding.instance!.addObserver(this);
    setStatus("offline");
   
  }

  void setStatus(String status) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      "status": status,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("offline");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch(int i) async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });
if(await _firestore
        .collection('users')
        .get()!=RangeError){
await _firestore
        .collection('users')
        .get()
        .then((value) {
      setState(() {
       // store=value.docs[0].data();
        userMap = value.docs[i].data();
        storeMap=userMap;
        isLoading = false;
      });
      print(userMap);
     // print(store);
    });
  }
  else {print("no user with this email");}

        }
    

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final worker = Provider.of<WorkerProvider>(context).worker;
   sizee= _firestore.collection('users').get().then((querySnapshot) {      
    (querySnapshot.size); 
}) ;

    return StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection("users").snapshots(),
    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
      if(snapshot.hasError){
        return Center(child: Text("something went wrong"),);
      }
      if(snapshot.connectionState== ConnectionState.waiting){
        return Center(child: Text("loading"),);
      }
      if(snapshot.hasData){
        return CustomScrollView(
          slivers: [       
      SliverList(delegate: SliverChildListDelegate(
        snapshot.data!.docs.map((DocumentSnapshot document ){
          Map<String,dynamic>? data = document.data()! as Map<String, dynamic>?;
          return ListTile(
            onTap: () {
                          
                          print(data);
                          String roomId = chatRoomId(
                              worker.name,
                              data!['name']);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Chat(
                                chatRoomId: roomId,
                                userMap: data!,
                              ),
                            ),
                          );},
                          leading: Icon(Icons.account_box, color: Colors.black),
            title: Text(data!['name']),
            subtitle: Text(data!['email']),
                        trailing: data!['name']=='omar'? Icon(Icons.call_received_outlined, color: Colors.green):Icon(Icons.account_box, color: Colors.black),
          );
        }).toList()
      ))
          ],
        );
      }
      return Container();

    },);
  }
}