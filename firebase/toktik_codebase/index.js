const apiModule2 = require("./ChatGptApi.js");

const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp(functions.config().firebase);

// At every minute.
exports.myScheduledCloudFunction = functions.pubsub.schedule("* * * * *").
    timeZone("America/New_York").
    onRun(async (context) => {
      // Initializing Prompt Generator:
      const promptGenerator = new apiModule2.PromptGenerator();
      // Fetching Text from ChatGpt:
      const newInfoTextString = apiModule2.
          fetchFromGpt(promptGenerator.getFactText(75, "German"));
      // console.log("Response: " + newInfoTextString);
      // Converting Test to Class InfoText:
      const newInfoTextData = new apiModule2.InfoText(newInfoTextString);
      console.log(newInfoTextData);
      console.log("Header: " + newInfoTextData.header);
      // console.log("Text: " + newInfoTextData.text);
      // Converting Data to Json:
      const newInfoTextJson = newInfoTextData.toJson();
      // Adding Data to Collection
      const collection = admin.firestore().collection("Random");
      collection.add(newInfoTextJson);
      return null;
    });
