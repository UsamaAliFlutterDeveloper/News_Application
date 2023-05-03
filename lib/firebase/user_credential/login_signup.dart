import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  ////////////////////////Sign In User Into RealTime DataBase///////////////////////////
  Future<String?> signInUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      String? uid = userCredential.user?.uid;

      return uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }
  ///////////////////////Sign Up User In Real Time DataBase ////////////////////

  Future<String?> registerUser(
    String email,
    String password,
    String name,
    String retypePassword,
  ) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String? uid = userCredential.user?.uid;
      FirebaseDatabase database = FirebaseDatabase.instance;

      // ignore: deprecated_member_use
      DatabaseReference userRef = database.reference().child('newusers');

      userRef
          .set({
            'name': name,
            'email': email,
            'password': password,
            'retypePassword': retypePassword,
          })
          .then((value) {})
          .catchError((error) {});

      return uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }
}
