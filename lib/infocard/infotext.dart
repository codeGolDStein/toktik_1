import 'dart:developer';
import 'dart:ffi';

// This Class takes the the Response from ChatGPT
// and seperates the header from the Text

class InfoText {
  late String mTopic; 
  late String mHeader;
  late String mText;
  
  InfoText(String topic, String header, String text) {
    mTopic = topic;
    mHeader = header;
    mText = text;
  }

  List<String> seperateText(String prompt) {
    log(prompt);
    String header = "";
    String text = "";
    bool switchHeaderToText = true;

    for (int i = 0; i < prompt.length; i++) {
      String char = prompt[i];
      if (char.codeUnitAt(0) == 10) { // Zeilen Umbruch Erkennungen
        switchHeaderToText = false;
        continue;
      } else {
        if(switchHeaderToText){
          header = header + char; 
        }else{
          text = text + char;
        }
      }
    }

    return [header, text];
  }

    Map<String, dynamic> toJson() {
    return { 
      "topic" : mTopic,
      'header': mHeader,
      'text': mText,
    };
  }
}
