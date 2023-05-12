import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String email;
  final String phone;
  final String location;
  final String avatar;
  final int points;
  final int liters;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    this.location = '',
    this.avatar = 'https://via.placeholder.com/150x150.png',
    this.points = 0,
    this.liters = 0,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      location: map['location'] ?? '',
      avatar: map['avatar'] ?? 'https://via.placeholder.com/150x150.png',
      points: map['points'] ?? 0,
      liters: map['liters'] ?? 0,
    );
  }

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel.fromMap(doc.data() as Map<String, dynamic>);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'location': location,
      'avatar': avatar,
      'points': points,
      'liters': liters,
    };
  }

  UserModel.empty()
      : name = '',
        email = '',
        phone = '',
        location = '',
        avatar = '',
        points = 0,
        liters = 0;
}
