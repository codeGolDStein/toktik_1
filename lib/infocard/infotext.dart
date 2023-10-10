import 'dart:developer';
import 'dart:ffi';

// This Class takes the the Response from ChatGPT
// and seperates the header from the Text

class InfoText {
  late String header;
  late String text;
  
  InfoText(String response) {
    header = seperateText(response)[0];
    text = seperateText(response)[1];
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
}
