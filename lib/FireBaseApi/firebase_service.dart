import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toktik/infocard/infotext.dart';

Future<InfoText> fetchRandomText() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<String, dynamic> randomText = {}; // Initialize with an empty map

  try {
    // Zähle die Gesamtanzahl der Texte in der informativeTexte-Sammlung
    QuerySnapshot countQuery = await firestore.collection('informativeTexte').get();
    int totalTexts = countQuery.size;

    // Generiere eine zufällige Zahl, die als Index für den abzurufenden Text verwendet wird
    Random random = Random();
    int randomIndex = random.nextInt(totalTexts);

    // Greife auf den Text mit dem zufälligen Index zu
    QuerySnapshot randomTextQuery = await firestore
        .collection('InfoTexts')
        .orderBy('topic')
        .startAfter([randomIndex])
        .limit(1)
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
  } catch (error) {
    print('Error: $error');
    throw error;
  }
}

