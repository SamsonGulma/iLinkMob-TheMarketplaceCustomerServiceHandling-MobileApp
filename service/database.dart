import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetail(Map<String, dynamic> userInfoMap, String id)async{
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getSalesItem(String name)async{
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }

  Future addSalesItem(Map<String, dynamic> userInfoMap, String id)async{
    return await FirebaseFirestore.instance
        .collection('name')
        .add(userInfoMap);
  }

}