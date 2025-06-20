import 'package:all_project/model/user_model.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ------------------------------
// Function to Sign Up a New User
// ------------------------------
Future<void> signUpUser(
  String name,
  String email,
  String phonenumber,
  String password,
) async {
  try {
    UserCredential userdetails = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    UserModel newUser = UserModel(
      name: name,
      email: email,
      phonenumber: phonenumber,
      password: password,
    );

    await FirebaseFirestore.instance
        .collection("users")
        .doc(userdetails.user!.uid)
        .set(newUser.toMap());

    print("User has registerd sucessfully");
  } catch (e) {
    print("Sign Up error:$e");
  }
}

// ------------------------------
// Function to Log In Existing User
// ------------------------------
Future<bool> loginUser(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print("Login Successfully. User UID: ${userCredential.user!.uid}");
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided.');
    } else {
      print('Login failed: ${e.message}');
    }
    return false;
  } catch (e) {
    print('Unexpected error: $e');
    return false;
  }
}

// ------------------------------
// Function to Send Password Reset Email
// ------------------------------


Future<void> resetPassword(String email) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    print("Password reset link sent sucessfully");
  } catch (e) {
    print("Sending failed $e");
  }
}

Future<String?> getUserName() async {
  try {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      print("No user is currently logged in.");
      return null;
    }

    final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (!doc.exists) {
      print("No user document found for UID: $uid");
      return null;
    }

    final name = doc.data()?['name'];
    print("Fetched user name: $name");
    return name;
  } catch (e) {
    print("Error fetching user name: $e");
    return null;
  }
}



class CameraService {
  CameraController? _controller;
  late List<CameraDescription> _cameras;

  Future<void> initialize() async {
    _cameras = await availableCameras();
    _controller = CameraController(
      _cameras.first,
      ResolutionPreset.medium,
    );
    await _controller!.initialize();
  }

  CameraController? get controller => _controller;

  void dispose() {
    _controller?.dispose();
  }
}





