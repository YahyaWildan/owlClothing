import 'package:firebase_auth/firebase_auth.dart';
import 'package:ocp/models/user_model.dart';
import 'package:ocp/services/user_service.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  //method

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user =
          await UserService().getUserById(userCredential.user!.uid);

      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      //register authentication
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      //objek user for firestore
      UserModel user = UserModel(
        id: userCredential.user!.uid,
        email: email,
        name: name,
        phone: phone,
        password: password,
        point: 50,
      );

      await UserService().setUser(user);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}
