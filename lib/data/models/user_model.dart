class User {
  final String name;
  final String phone;
  final String password;
  final bool isStaff;
  final bool isAdmin;
  final String photo;

  User({
    required this.name,
    required this.phone,
    required this.password,
    required this.isStaff,
    required this.isAdmin,
    required this.photo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      phone: json['phone'],
      password: json['password'],
      isStaff: json['is_staff'],
      isAdmin: json['is_admin'],
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'password': password,
      'is_staff': isStaff,
      'is_admin': isAdmin,
      'photo': photo,
    };
  }
}
