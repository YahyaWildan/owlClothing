import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String phone;
  final String password;
  final int point;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.password,
    this.point = 0,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        email,
        name,
        phone,
        password,
        point,
      ];
}
