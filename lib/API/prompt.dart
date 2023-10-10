import 'dart:math';

enum topic {
  Geschichte,
  Politik,
  Wirtschaft,
  Geografie,
  Anatomie,
  Gesundheit,
  Sport,
  Fitness,
  Ernaehrung,
  Astronomie,
  Technologie,
  Musik,
  Kunst,
}

String getRandomTopic(){
  final random = Random();
  final randomInt = random.nextInt(topic.values.length);
  String topicString = topic.values[randomInt].toString();
  return topicString.substring(6, topicString.length);
}

class Prompt {

  static getFactText(int length, String language, [String? topic]) {

    String textTopic;

    if(topic == null){ 
      textTopic = getRandomTopic();
    }else{
      textTopic = topic;
    }

    // return """
    //   Einzeln:

    //   Schreibe mir einen $length Wörter langen Fakt Text.
    //   Der Text hat folgende Attribute:

    //   - Thema: $textTopic
    //   - Sprache: $language
    //   - Der Text ist Informativ spannend und einfach zu lesen.
    //   - Der Text muss in Form eines Fakt geschrieben sein. 
    //     Das soll ein Text sein den man gerne nebenbei liest um sein Allgemein wissen zu verbessern.
    //   - Gebe Dem Text noch eine Überschrift, diese steht in der ersten
    //     Zeile deines Outputs """;

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




