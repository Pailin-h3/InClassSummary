import firebase from "firebase/app";

const firebaseConfig = {
    apiKey: "",
    authDomain: "mentor2code.firebaseapp.com",
    databaseURL: "https://mentor2code.firebaseio.com",
    projectId: "mentor2code",
    storageBucket: "",
    messagingSenderId: "",
    appId: "",
    measurementId: "",
  };

firebase.initializeApp(firebaseConfig);