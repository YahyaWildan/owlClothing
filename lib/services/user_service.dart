import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ocp/models/user_model.dart';

class UserService {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'phone': user.phone,
        'point': user.point,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot['email'],
        name: snapshot['name'],
        phone: snapshot['phone'],
        password: snapshot['password'],
        point: snapshot['point'],
      );
    } catch (e) {
      throw e;
    }
  }
}
