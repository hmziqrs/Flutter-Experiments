const functions = require('firebase-functions');
const admin = require('firebase-admin');
const _ = require('lodash');
// admin.initializeApp({});
admin.initializeApp({
  apiKey: 'AIzaSyCtgDckcyEitXMzvvxfzmGAW1Rd4RXWSJ4',
  authDomain: 'flutter-experiments.firebaseapp.com',
  databaseURL: 'https://flutter-experiments.firebaseio.com',
  projectId: 'flutter-experiments',
  storageBucket: 'flutter-experiments.appspot.com',
  messagingSenderId: '125193658621',
});

const firestore = admin.firestore();
firestore.settings({
  timestampsInSnapshots: true,
});

const database = admin.database().ref();
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });

exports.createUser = functions.auth.user().onCreate(rawUser => {
  const user = _.pick(rawUser, [
    'uid',
    'email',
    'emailVerified',
    'displayName',
    'photoURL',
    'phoneNumber',
  ]);
  // console.log('====================================');
  // console.log('rawUser.providerData', rawUser.providerData);

  rawUser.providerData.forEach(provider => {
    if (provider.providerId === 'google.com') {
      user.googleId = provider.uid;
    } else if (provider.providerId === 'facebook.com') {
      user.facebookId = provider.uid;
    }
  });

  // console.log('====================================');
  // console.log('PARSED USER FOR CLOUD FUNCITONS', user);
  return database
    .child(`users/${user.uid}`)
    .set(user)
    .then(() => {
      return firestore
        .collection('users')
        .doc(rawUser.uid)
        .set(user);
    });
});
