import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'api_const.dart';

class ApiService {
  // Send Messages Function:
  static Future<String> fetchFromGpt(String message) async {
    log(message);
    try {
      var response = await http.post(
          Uri.parse("https://api.openai.com/v1/chat/completions"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $API_KEY"
          },
          body: jsonEncode(
            {
              "model": "gpt-3.5-turbo",
              "messages": [
                {"role": "system", "content": message}
              ],
              "temperature": 1
            },
          ));
      Map jsonResponse = jsonDecode(response.body);
      // log("jsonResponse: $jsonResponse");

      if (jsonResponse["error"] != null) {
        throw HttpException(jsonResponse["error"]["message"]);
      }
      //   log("response: " + jsonResponse["choices"][0]["message"]["content"]);
      return jsonResponse["choices"][0]["message"]["content"];
    } catch (error) {
      log("error $error");
      rethrow;
    }
  }
}
