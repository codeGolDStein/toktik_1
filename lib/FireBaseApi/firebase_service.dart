import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toktik/infocard/infotext.dart';
import 'dart:developer' as developer;

Future<InfoText> fetchRandomText() async {
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
        // .startAfter([1])
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
  // } catch (error) {
  //   developer.log('fetchRandomText Error: $error');
  //   throw error;
  // }
}

