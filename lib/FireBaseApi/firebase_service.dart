import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toktik/infocard/infotext.dart';
import 'dart:developer' as developer;

Future<InfoText> fetchText() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<String, dynamic> randomText = {}; // Initialize with an empty map

  // try {
    // Zähle die Gesamtanzahl der Texte in der informativeTexte-Sammlung
    QuerySnapshot countQuery = await firestore.collection('InfoTexts').get();
    int totalTexts = countQuery.size;
    // developer.log(totalTexts.toString());

    // Generiere eine zufällige Zahl, die als Index für den abzurufenden Text verwendet wird
    Random random = Random();
    int randomIndex = random.nextInt(totalTexts + 1);
    developer.log(randomIndex.toString());

    // Greife auf den Text mit dem zufälligen Index zu
    QuerySnapshot randomTextQuery = await firestore
        .collection('InfoTexts')
        .orderBy('topic')
        .limit(1)
        .startAfter([randomIndex])
        .get();

    // Extrahiere den zufälligen Text
    randomTextQuery.docs.forEach((doc) {
      randomText = doc.data() as Map<String, dynamic>;
    });

    return InfoText(
      randomText["topic"] ?? "",
      randomText["header"] ?? "",
      randomText["text"] ?? "",
    );
}

// Future<InfoText> fetchText() async{

//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   Map<String, dynamic> text = {};
//   Random random = Random();
//   int randomIndex = random.nextInt(10);

//   QuerySnapshot countQuery = await firestore.collection('InfoTexts').get();

//   // QuerySnapshot randomTextQuery = await firestore
//   //   .collection('InfoTexts')
//   //   .orderBy('topic')
//   //   .limit(1)
//   //   .startAfter([randomIndex])
//   //   .get();

//   // Zuerst die Anzahl der Dokumente in der Sammlung abrufen
//   QuerySnapshot snapshot = await firestore.collection('InfoTexts').get();
//   int totalDocuments = snapshot.docs.length;

//   // Das Dokument anhand des zufälligen Index abrufen
//   QueryDocumentSnapshot randomDocument = snapshot.docs[randomIndex];


//   // Daten aus dem Dokument auslesen
//   var data = randomDocument.data();

//   // randomTextQuery.docs.forEach ((doc){
//   //     text = doc.data() as Map<String, dynamic>;
//   // });
//   if (data != null){
//     String topic = data["topic"];
//   }
      
//   return InfoText(
//       data["topic"] ?? "",
//       text["header"] ?? "",
//       text["text"] ?? "",
//   );
// }

