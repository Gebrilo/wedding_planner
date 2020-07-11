import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';



//import 'package:firebase_auth/firebase_auth.dart';
//
//
//
//abstract class BaseAuth {
//  Future<String> signIn(String email, String password);
//
//  Future<String> signUp(String email, String password);
//
//  Future<FirebaseUser> getCurrentUser();
//
//  Future<void> sendEmailVerification();
//
//  Future<void> signOut();
//
//  Future<bool> isEmailVerified();
//}
//
//class Auth implements BaseAuth {
//  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//
//  Future<String> signIn(String email, String password) async {
//    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
//        email: email, password: password);
//    FirebaseUser user = result.user;
//    return user.uid;
//  }
//
//  Future<String> signUp(String email, String password) async {
//    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
//        email: email, password: password);
//    FirebaseUser user = result.user;
//    return user.uid;
//  }
//
//  Future<FirebaseUser> getCurrentUser() async {
//    FirebaseUser user = await _firebaseAuth.currentUser();
//    return user;
//  }
//
//  Future<void> signOut() async {
//    return _firebaseAuth.signOut();
//  }
//
//  Future<void> sendEmailVerification() async {
//    FirebaseUser user = await _firebaseAuth.currentUser();
//    user.sendEmailVerification();
//  }
//
//  Future<bool> isEmailVerified() async {
//    FirebaseUser user = await _firebaseAuth.currentUser();
//    return user.isEmailVerified;
//  }
//}
//
//



enum Gender {
  male,
  female,
}

class GenderSelector {
  GenderSelector({this.genders});
  final Gender genders;
  Gender gender(Gender _gender) {
    return _gender = genders;
  }
}


class Data{

//
//  Future<http.Response> fetchPost() {
//    return http.post('https://jsonplaceholder.typicode.com/posts/1');
//  }
//
//  Future<Map<String, dynamic>> signup(String email, String password) async {
//    final Map<String, dynamic> authData = {
//      'email': email,
//      'password': password,
//      'returnSecureToken': true
//    };
//    final http.Response response = await http.post(
//      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=[API_KEY]',
//      body: json.encode(authData),
//      headers: {'Content-Type': 'application/json'},
//    );
//    final Map<String, dynamic> responseData = json.decode(response.body);
//    bool hasError = true;
//    String message = 'Something went wrong.';
//    if (responseData.containsKey('idToken')) {
//      hasError = false;
//      message = 'Authentication succeeded!';
//    } else if (responseData['error']['message'] == 'EMAIL_EXISTS') {
//      message = 'This email already exists.';
//    }
//    return {'success': !hasError, 'message': message};
//  }

  Future<bool> saveList(List<String> list) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('categorylist', list);
    print('categorylist');
    return prefs.commit();
}
  Future<List<String>> getList() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList('categorylist');
    return list;
  }




  Future<bool> saveUserName(String user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('ClintName', user);
    print(prefs.getString('ClintName'));
    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userName = prefs.getString('ClintName');
    return userName;
  }

  Future<bool> saveFName(String fName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('FName', fName);
    print(prefs.getString('FName'));
    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<String> getFName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String fName = prefs.getString('FName');
    return fName;
  }

  Future<bool>saveBudget(int budget) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('budget', budget);
    print(prefs.getInt('budget'));
    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<int> getBudget()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int budget = prefs.getInt('budget');
    return budget;
  }

  Future<bool>saveDate(String date) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('date', date);
    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<String> getDate()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String date = prefs.getString('date');
    return date;
  }
}

class Post {
static  Data x =Data();
   Future<String> userName = x.getUserName();
   Future<String> weddingDay = x.getDate();
   Future<int> budget = x.getBudget();
   int number = 0111558473;


  Post({this.userName, this.weddingDay, this.budget, this.number});

  s(){
  return print(userName);
  }

}




