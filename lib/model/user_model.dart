class UserModel {
  final String name;
  final String email;
  final String password;
  final String phonenumber;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phonenumber,
  });

  // Convert UserModel to a map (for Firestore)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password, // Storing plain text passwords is not secure!
      'phonenumber': phonenumber,
    };
  }

  // Create a UserModel from a Firestore document
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      phonenumber: map['phonenumber'],
    );
  }
}
