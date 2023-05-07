class User {
  final String name;
  final String email;
  final String phone;
  final String location;
  final String avatar;
  final int points;
  final int liters;

  User({
    required this.name,
    required this.email,
    required this.phone,
    this.location = '',
    this.avatar = 'https://via.placeholder.com/50x50.png?text=JD',
    this.points = 0,
    this.liters = 0,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      location: map['location'] ?? '',
      avatar: map['avatar'] ?? 'https://via.placeholder.com/50x50.png?text=JD',
      points: map['points'] ?? 0,
      liters: map['liters'] ?? 0,
    );
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
}
