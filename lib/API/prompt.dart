import 'dart:core';
import 'dart:math';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

class PromptGenerator {
  late List<String> topics;

  PromptGenerator() {
    topics = [
      "Geschichte",
      "Politik",
      "Wirtschaft",
      "Geografie",
      "Anatomie",
      "Gesundheit",
      "Sport",
      "Fitness",
      "Ernaehrung",
      "Astronomie",
      "Technologie",
      "Musik",
      "Kunst",
    ];
  }

  String getRandomTopic() {
    final random = Random();
    final randomInt = random.nextInt(topics.length);
    String topicString = topics[randomInt].toString();
    return topicString.substring(6, topicString.length);
  }

  String getFactText(int length, String language, [String? topic]) {
    String textTopic;

    if (topic == null) {
      textTopic = getRandomTopic();
    } else {
      textTopic = topic;
    }

    return """
      Ich möchte mein Wissen im Thema $textTopic verbessern. Schreibe mir 
      dazu einen Text mit folegenden Attributen:

      - Sprache: $language
      - Der Text MUSS eine passende Überschrifft haben.
      - Nach der Überschrifft Steht IMMER eine Zeile Abstand
      - Der Text darf nicht mehr als $length Wörter haben.
      - Er sollte das Wissen des Lesers erweitern. Das heißt 
        es kann gerne etwas sein was man davor noch nie gehört
        oder gelesen hat. """;
  }

  static getTest() {
    return "Dies ist ein Test";
  }
}
