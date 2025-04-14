

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant/feature/auth/model/user.dart';

class AuthServices {

 final FirebaseAuth _firebaseAuth;

 // In a production scenario, OTP should be generated on a secure server.
 // Here, we simulate an OTP process locally.
 String? _generatedOtp;

 AuthServices({FirebaseAuth? firebaseAuth})
     : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

 // Registration: Create a new user and trigger verification (if needed)
 Future<UserCredential?> registerWithEmail({
   required String name,
   required String email,
   required String password,
   required String phone,
 }) async {
   try {
     final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
       email: email,
       password: password,
     );
     if(credential.user != null) {
       // Optionally, send an OTP to the user's email or phone for verification
       await addUser(email: email, uid: credential.user!.uid, name: name, phone: phone);
     }
     return credential;
   } on FirebaseAuthException catch (e) {
     if (e.code == 'weak-password') {
       print('The password provided is too weak.');
     } else if (e.code == 'email-already-in-use') {
       print('The account already exists for that email.');
     }
     return null;
   } catch (e) {
     print(e);
     return null;
   }

 }
 CollectionReference users = FirebaseFirestore.instance.collection('users');

 Future<void> addUser({String name = '', String email = '', String phone = '', required String uid}) async {
   // Call the user's CollectionReference to add a new user
   return users.doc(uid)
       .set({
     'name': name,
     'email': email,
     'phone': phone,
     'uid': uid,
   })
       .then((value) => print("User Added"))
       .catchError((error) => print("Failed to add user: $error"));
 }

 Future<UserModel> getUserByUid(String uid) async {
   final doc = await users.doc(uid).get();
   if (doc.exists) {
     return UserModel.fromMap(doc.data() as Map<String, dynamic>);
   } else {
     throw Exception('User not found');
   }
 }

 Future<UserCredential> loginWithEmail({
   required String email,
   required String password,
 }) async {
   return await _firebaseAuth.signInWithEmailAndPassword(
     email: email,
     password: password,
   );
 }

 // Simulated OTP: In practice, you would call a cloud function or external service
 Future<void> sendOtpEmail({required String email}) async {
   // Generate a 6-digit OTP
   final random = Random();
   _generatedOtp = (random.nextInt(900000) + 100000).toString();

   // TODO: Use a backend service or cloud function to send the OTP to the email.
   // For simulation, you might print the OTP in the console.
   print('OTP for $email is $_generatedOtp');
 }

 // Verify OTP: Check if the entered OTP matches the generated OTP
 Future<bool> verifyOtp({required String enteredOtp}) async {
   return _generatedOtp == enteredOtp;
 }

 // Reset Password: Firebase sends a password reset email
 Future<void> resetPassword({required String email}) async {
   await _firebaseAuth.sendPasswordResetEmail(email: email);
 }
}