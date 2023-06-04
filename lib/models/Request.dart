import 'Gift.dart';

class Request {
  final int? amount;
  final String? address;
  final DateTime? date;
  final List<Map<String, dynamic>> gifts;
  final String? userUID;
  final bool? status;
  final String? qrCode;
  late final String? docId;
  List<Gift>? giftObjects; // Add the optional attribute for the array of Gift objects

  Request({
    this.amount,
    this.address,
    this.date,
    List<Map<String, dynamic>>? gifts,
    this.userUID,
    this.status,
    this.qrCode,
    this.docId,
    this.giftObjects, // Include the optional attribute for the array of Gift objects in the constructor
  }) : gifts = gifts ?? [];

  factory Request.fromMap(Map<String, dynamic> map,String documentID) {
    return Request(
      amount: map['amount'],
      address: map['address'],
      date: map['date'] != null ? DateTime.parse(map['date']) : null,
      gifts: map['gifts'] != null
          ? (map['gifts'] as List<dynamic>)
          .map((item) => item as Map<String, dynamic>)
          .toList()
          : [],
      userUID: map['userUID'],
      status: map['status'],
      qrCode: map['qrCode'],
      docId: documentID,
      giftObjects: null, // Set the initial value of the giftObjects attribute to null
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'address': address,
      'date': date?.toIso8601String(),
      'gifts': gifts,
      'userUID': userUID,
      'status': status,
      'qrCode': qrCode,
      'docId': docId,
    };
  }
}
