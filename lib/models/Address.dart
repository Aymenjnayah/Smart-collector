import 'package:cloud_firestore/cloud_firestore.dart';

class Address {
  String? uid; // UID attribute added
  String? city;
  String? town;
  String? address;
  String? comment;
  double? latitude;
  double? longitude;

  Address({
    this.uid,
    this.city,
    this.town,
    this.address,
    this.comment,
    this.latitude,
    this.longitude,
  });

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      uid: map['uid'] as String?, // UID included
      city: map['city'] as String?,
      town: map['town'] as String?,
      address: map['address'] as String?,
      comment: map['comment'] as String?,
      latitude: (map['latitude'] as num?)?.toDouble(),
      longitude: (map['longitude'] as num?)?.toDouble(),
    );
  }

  factory Address.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    return Address(
      uid: snapshot.id, // UID assigned from snapshot ID
      city: data?['city'] as String?,
      town: data?['town'] as String?,
      address: data?['address'] as String?,
      comment: data?['comment'] as String?,
      latitude: (data?['latitude'] as num?)?.toDouble(),
      longitude: (data?['longitude'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'city': city,
      'town': town,
      'address': address,
      'comment': comment,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
