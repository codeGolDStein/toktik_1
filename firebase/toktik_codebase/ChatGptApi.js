const {OpenAI} = require("openai");


const openai = new OpenAI({
  // apiKey: "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",
  apiKey: "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",
});


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
  separateText(prompt) {
    console.log("Prompt: " + prompt);
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
