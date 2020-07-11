import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedding_planner/model/user.dart';
import 'package:wedding_planner/model/wedding.dart';
import '../model/data_info.dart';



class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference weddingPlannerCollection = Firestore.instance.collection('weddingInfo');

  Future updateUserData(String name, String weddingDay, int weddingBudget , int mobileNumber)async {
    return await weddingPlannerCollection.document(uid).setData({
      'name' : name,
      'Day' : weddingDay,
      'Budget' : weddingBudget,
      'mobile' : mobileNumber,
    });
  }


  // wedding list from snapShot

  List<Wedding> _weddingListFromSnapShot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Wedding(
        name: doc.data['name'] ?? '',
        weddingDate : doc.data['Day'] ?? '0-0-0000',
        budget: doc.data['Budget'] ?? 0,
        mobileNumber: doc.data['mobile'] ?? 01000000000
      );
    }).toList();
  }


  // User Data from SnapShot
  UserData _userDataFromSnapShot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      weddingDate: snapshot.data['Day'],
      budget: snapshot.data['Budget'],
      mobileNumber: snapshot.data['mobile']
    );
  }


  // get User Stream

  Stream<List<Wedding>> get wedding {
    return weddingPlannerCollection.snapshots().map(_weddingListFromSnapShot);
  }

  // get User doc Stream

  Stream<UserData> get userData {

    return weddingPlannerCollection.document(uid).snapshots().map(_userDataFromSnapShot);
  }


}