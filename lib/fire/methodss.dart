import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class fire{

  Future<User?> createAccount(String name, String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try{
      User? user = (await _auth.createUserWithEmailAndPassword(email: email, password: password))
      .user;

      if(user != null){
        print("account created succesfull");
        user.updateProfile(displayName: name);
        await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
      "name": name,
      "email": email,
      "status": "Unavalible",
      "uid": _auth.currentUser!.uid,
    });

    
        return user;
      }

    }catch(e) {
      print(e);

      return null;
    }
}

Future<User?> login( String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
  
    try{
      User? user =(await _auth.signInWithEmailAndPassword(email: email, password: password))
      .user;

      if(user !=null){
        print("login successful");

        
        return user;
      } else {
        print("login failed");


        return user;
      }

    }catch(e){
      print(e);
      return null;
    }
}
}



