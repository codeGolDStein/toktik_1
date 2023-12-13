const {OpenAI} = require("openai");
// import OpenAI from "openai";

// const configuration = new Configuration({
//   apiKey: "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",
// });

const openai = new OpenAI({
  apiKey: "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",
});

// /**
//  * Fetches data from the GPT API.
//  * @param {string} message - The message to send to the GPT API.
//  * @return {Promise<string>} - A promise that resolves
// to the content received
//  * from the GPT API.
//  */
// async function fetchFromGpt(message) {
//   try {
//     const response = await fetch("https://api.openai.com/v1/chat/completions", {
//       method: "POST",
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization":
//           `Bearer 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`,
//       },
//       body: JSON.stringify({
//         "model": "gpt-3.5-turbo",
//         "messages": [
//           {"role": "system", "content": message},
//         ],
//         "temperature": 1,
//       }),
//     });

//     const jsonResponse = await response.json();
//     console.log(jsonResponse);

//     if (jsonResponse.error) {
//       throw new Error(jsonResponse.error.message);
//     }

//     return jsonResponse.choices[0].message.content;
//   } catch (error) {
//     console.error(`error ${error}`);
//     throw error;
//   }
// }


/**
 * Fetches data from the GPT API.
 * @param {string} message - The message to send to the GPT API.
 * @return {Promise<string>} - A promise that resolves
 to the content received
 * from the GPT API.
 */
async function fetchFromGpt(message) {
  const response = await openai.chat.completions.create({
    "model": "gpt-3.5-turbo",
    "messages": [
      {
        role: "system",
        content: message,
      },
    ],
    "temperature": 1,
  });
  console.log(response.choices[0].message.content);
  return response.choices[0].message.content;
}


// import OpenAI from "openai";

// /**
//  * Fetches data from the GPT API.
//  * @param {string} message - The message to send to the GPT API.
//  * @return {Promise<string>} - A promise that resolves
//  to the content received
//  * from the GPT API.
//  */
// async function fetchFromGpt(message) {
//   const openai = new OpenAI({
//     apiKey: process.env.OPENAI_API_KEY,
//   });
//   const chatCompletion = await openai.chat.completions.create({
//       messages: [{ role: "user", content: "Say this is a test" }],
//       model: "gpt-3.5-turbo",
//   });
// }


/**
 * Class representing information text.
 */
class InfoText {
  /**
   * Creates an instance of InfoText.
   * @param {string} response - The response string containing
   * header and text separated by a line break.
   */
  constructor(response) {
    /**
     * The header of the information text.
     * @type {string}
     */
    this.header = this.separateText(response)[0];

    /**
     * The text content of the information text.
     * @type {string}
     */
    this.text = this.separateText(response)[1];
  }

  /**
   * Separates the header and text from the given prompt.
   * @param {string} prompt - The prompt string containing
   * header and text separated by a line break.
   * @return {string[]} An array containing header and text.
   */
  // separateText(prompt) {
  //   let header = "";
  //   let text = "";
  //   let switchHeaderToText = true;

  //   for (let i = 0; i < prompt.length; i++) {
  //     const char = prompt[i];
  //     if (char.charCodeAt(0) === 10) { // Line break detection
  //       switchHeaderToText = false;
  //       continue;
  //     } else {
  //       if (switchHeaderToText) {
  //         header += char;
  //       } else {
  //         text += char;
  //       }
  //     }
  //   }

  //   return [header, text];
  // }

  /**
  * Separates the header and text from the given prompt.
  * @param {string} prompt - The prompt string containing
  * header and text separated by a line break.
  * @return {string[]} An array containing header and text.
  */
  separateText(prompt) {
    const [header, ...rest] = prompt.split("\n\n");
    const content = rest.join("\n").trim();
    return [header.trim(), content];
  }


  /**
   * Converts the InfoText instance to JSON format.
   * @return {Object} The JSON representation of the InfoText instance.
   */
  toJson() {
    return {
      "header": this.header,
      "text": this.text,
    };
  }
}

// Example usage:
// const info = new InfoText("Header\nThis is the text.");
// console.log(info.toJson());


/**
 * Klasse für die Erstellung von Text-Prompts.
 */
class PromptGenerator {
  /**
   * Konstruktor für die Prompt-Klasse.
   */
  constructor() {
    /**
     * Liste der verfügbaren Themen.
     * @type {string[]}
     */
    this.topics = [
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

  /**
   * Gibt ein zufälliges Thema aus der Liste zurück.
   * @return {string} Ein zufälliges Thema.
   */
  getRandomTopic() {
    const randomInt = Math.floor(Math.random() * this.topics.length);
    const topicString = this.topics[randomInt];
    return topicString.substring(6);
  }

  /**
   * Erzeugt einen Text-Prompt mit den angegebenen Parametern.
   * @param {number} length - Die maximale Länge des Textes in Wörtern.
   * @param {string} language - Die Sprache des Textes.
   * @param {string} [topic] - Das gewünschte Thema (optional).
   * @return {string} Der generierte Text-Prompt.
   */
  getFactText(length, language, topic) {
    let textTopic;

    if (!topic) {
      textTopic = this.getRandomTopic();
    } else {
      textTopic = topic;
    }

    return `
      Ich möchte mein Wissen im Thema ${textTopic} verbessern. Schreibe mir 
      dazu einen Text mit folgenden Attributen:

      - Sprache: ${language}
      - Der Text MUSS eine passende Überschrift haben.
      - Nach der Überschrift steht IMMER eine Zeile Abstand.
      - Der Text darf nicht mehr als ${length} Wörter haben.
      - Er sollte das Wissen des Lesers erweitern. Das heißt, 
        es kann gerne etwas sein, was man davor noch nie gehört
        oder gelesen hat.`;
  }

  /**
   * Gibt einen Test-String zurück.
   * @return {string} Ein Test-String.
   */
  static getTest() {
    return "Dies ist ein Test";
  }
}

module.exports = {
  InfoText,
  PromptGenerator,
  fetchFromGpt,
};
