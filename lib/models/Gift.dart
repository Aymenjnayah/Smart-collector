class Gift {
  final String? id;
  final String title;
  final String imageUrl;
  final double price;
  final int quantity;
  int? selectedCount;

  Gift({
    this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    this.selectedCount,
  });

  factory Gift.fromJson(Map<String, dynamic> json) {
    return Gift(
      id: json['uid'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      price: double.parse(json['price'].toString()),
      quantity: json['quantity'],
    );
  }

  factory Gift.fromMap(Map<String, dynamic> map) {
    return Gift(
      id: map['uid'],
      title: map['title'],
      imageUrl: map['imageUrl'],
      price: map['price'].toDouble(),
      quantity: map['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }

  Gift copyWith({
    String? id,
    String? title,
    String? imageUrl,
    double? price,
    int? quantity,
    int? selectedCount,
  }) {
    return Gift(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      selectedCount: selectedCount ?? this.selectedCount,
    );
  }
}
