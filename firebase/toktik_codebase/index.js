const apiModule2 = require("./ChatGptApi.js");

const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp(functions.config().firebase);

// At every minute.
exports.myScheduledCloudFunction = functions.pubsub.schedule("* * * * *").
    timeZone("America/New_York").
    onRun(async (context) => {
      // Initializing Prompt Class:
      const prompt = new apiModule2.Prompt();
      // Fetching Text from ChatGpt:
      const chatGptResponse = await apiModule2.
          fetchFromGpt(prompt.text);
      // console.log("Response: " + newInfoTextString);
      // Converting Test to Class InfoText:
      const newInfoTextData = new apiModule2.
          InfoText(chatGptResponse, prompt.topic);
      // console.log(newInfoTextData);
      console.log("Topic: " + newInfoTextData.topic);
      console.log("Header: " + newInfoTextData.header);
      console.log("Text: " + newInfoTextData.text);
      // Converting Data to Json:
      const newInfoTextJson = newInfoTextData.toJson();
      // Adding Data to Collection
      const collection = admin.firestore().collection("InfoTexts");
      collection.add(newInfoTextJson);
      return null;
    });
