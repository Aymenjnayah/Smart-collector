class Request {
  final int? amount;
  final String? address;
  final DateTime? date;
  final List<Map<String, dynamic>> gifts;
  final String? userUID;
  final String? status;
  late final String? qrCode;

  Request({
    this.amount,
    this.address,
    this.date,
    List<Map<String, dynamic>>? gifts,
    this.userUID,
    this.status,
    this.qrCode,
  }) : gifts = gifts ?? [];

  factory Request.fromMap(Map<String, dynamic> map) {
    return Request(
      amount: map['amount'],
      address: map['address'],
      date: map['date'] != null ? DateTime.parse(map['date']) : null,
      gifts: map['gifts'] != null
          ? (map['gifts'] as List<dynamic>).map((item) => item as Map<String, dynamic>).toList()
          : null,
      userUID: map['userUID'],
      status: map['status'],
      qrCode: map['qrCode'],
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
    };
  }
}
