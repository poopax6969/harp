const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onUserDeleted = functions
  .region("us-central1")
  .auth.user()
  .onDelete(async (user) => {
    let firestore = admin.firestore();
    let userRef = firestore.doc("users/" + user.uid);
    await firestore
      .collection("users")
      .where("uid", "==", user.uid)
      .get()
      .then(async (querySnapshot) => {
        for (var doc of querySnapshot.docs) {
          await doc.ref
            .collection("uploadImage")
            .get()
            .then(async (q) => {
              for (var d of q.docs) {
                console.log(
                  `Deleting document ${d.id} from collection uploadImage`,
                );
                await d.ref.delete();
              }
            });
        }
      });
    await firestore.collection("users").doc(user.uid).delete();
  });
