import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

// Global Firebase instances
final FirebaseAuth auth = FirebaseAuth.instance;
final DatabaseReference database = FirebaseDatabase.instance.ref();

// Register user
Future<String?> registerUser(String name, String email, String password) async {
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    String uid = userCredential.user!.uid;

    await database.child("users").child(uid).set({
      'name': name,
      'email': email,
      'created_at': DateTime.now().toIso8601String(),
    });

    return "Success";
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
}

// Login user
Future<String?> loginUser(String email, String password) async {
  try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    return "Success";
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
}

// Sign out user
Future<void> signOutUser() async {
  await auth.signOut();
}
