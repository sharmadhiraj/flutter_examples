class User {
  final String name, email, address;

  User(
    this.name,
    this.email,
    this.address,
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['name'],
      json['email'],
      json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'address': address};
  }
}
