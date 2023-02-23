
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hpets/main.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<User?> logIn(String email, String password, BuildContext context) async {
    var user = await _auth.signInWithEmailAndPassword(email: email, password: password);
    // logger.e("user ${user}");
    return user.user;
  }


  logOut() async{
    return await _auth.signOut();
  }

  Future<User?> register(String email, String password, String name, String surname) async{

    var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);

    user.user!.updateDisplayName("${name} ${surname}");

    // addUser(email, password, name, surname);


    await _firestore.collection("User").doc(user.user!.uid)
    .set({
      'email' : email,
      'password' : password,
      'name' : name,
      'surname' : surname,
    });



    return user.user;
  }

  //
  // Future<User?> changePassword(String email, String password, String name, String surname) async{
  //
  //   var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //
  //   user.user!.updateDisplayName("${name} ${surname}");
  //
  //   // addUser(email, password, name, surname);
  //
  //
  //   await _firestore.collection("User")
  //       .doc(user.user!.uid)
  //       .set({
  //     'email' : email,
  //     'password' : password,
  //     'name' : name,
  //     'surname' : surname,
  //
  //
  //   });
  //
  //
  //
  //   return user.user;
  // }

}