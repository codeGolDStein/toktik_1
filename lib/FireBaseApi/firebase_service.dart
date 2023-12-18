import 'package:cloud_firestore/cloud_firestore.dart';
// import "firebase/config";

  Future<List> fetchAllContact() async {
    List contactList = [];
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('my_contact').doc('details').get();
    
    // contactList = documentSnapshot.data()['contacts'];
    return contactList;
  }