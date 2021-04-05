
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
class FirAuth {
    
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  void sigUp(String username , String pass, Function onSuccess){
      _firebaseAuth
      .createUserWithEmailAndPassword(email: username, password: pass)
      .then((User){
        print(username);
      })
      .catchError((Error){
        //Todo
      });

  }
  createUser(String  userId, String name , String pass, Function onSuccess){
    var user = {
      "name" : name,
      "pass" : pass
    };
      var ref= FirebaseDatabase.instance.reference().child("user");
      ref.child(userId).set(user)
      .then((user) {
        onSuccess();
      })
      .catchError((Error){
        //Todo
      });
  }
}