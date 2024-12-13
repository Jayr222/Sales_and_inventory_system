const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");
const admin = require("firebase-admin");

admin.initializeApp();

exports.updateSales = onRequest((request, response) => {
  // Example log for the function
  logger.info("Updating sales data", {structuredData: true});

  // Extract data from the request (assuming JSON data is sent)
  const {type, value} = request.body;

  // Example Firebase Firestore update code
  const firestore = admin.firestore();
  const salesRef = firestore.collection("reports").doc("sales");

  salesRef
      .set({
        [type]: value,
      })
      .then(() => {
        response.status(200).send("Sales data updated successfully");
      })
      .catch((error) => {
        logger.error("Error updating sales data: ", error);
        response.status(500).send("Error updating sales data");
      });
});
