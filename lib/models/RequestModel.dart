import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_collector/models/user.dart';

class RequestModel {
  final String id;
  final int liters;
  final String gift;
  final String date;
  final String userUid;
  final UserModel user;

  RequestModel({
    required this.id,
    required this.liters,
    required this.gift,
    required this.date,
    required this.userUid,
    required this.user,
  });

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    return RequestModel(
      id: map['id'] ?? '',
      liters: map['liters'] ?? 0,
      gift: map['gift'] ?? '',
      date: map['date'] ?? '',
      userUid: map['userUid'] ?? '',
      user: UserModel.fromMap(map['user']),
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'liters': liters,
      'gift': gift,
      'date': date,
      'userUid': userUid,
      'user': user.toMap(),
    };
  }

  RequestModel copyWith({
    String? id,
    int? liters,
    String? gift,
    String? date,
    String? userUid,
    UserModel? user,
  }) {
    return RequestModel(
      id: id ?? this.id,
      liters: liters ?? this.liters,
      gift: gift ?? this.gift,
      date: date ?? this.date,
      userUid: userUid ?? this.userUid,
      user: user ?? this.user,
    );
  }
}
