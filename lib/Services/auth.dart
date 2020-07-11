import 'package:firebase_auth/firebase_auth.dart';
import 'package:wedding_planner/Services/database.dart';
import 'package:wedding_planner/model/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;



  // create user obj based on firebase.
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
//        .map((FirebaseUser user) => _userFromFirebaseUser(user)); the same...
        .map(_userFromFirebaseUser);
  }


  // Sign in anon
Future<dynamic> signInAnon() async{
  try{
    AuthResult result = await _auth.signInAnonymously();
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;
  }
}


// Sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }


// register with email and password

  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData('', '0-00-0000', 00000 , 0100000000);
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }



  //sing out

  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}