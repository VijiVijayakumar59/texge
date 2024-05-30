// class User {
//   final String name;
//   final String email;
//   final String mobileNo;
//   final DateTime updatedAt;
//   final DateTime createdAt;
//   final int id;

//   User({
//     required this.name,
//     required this.email,
//     required this.mobileNo,
//     required this.updatedAt,
//     required this.createdAt,
//     required this.id,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       name: json['name'],
//       email: json['email'],
//       mobileNo: json['mobile_no'],
//       updatedAt: DateTime.parse(json['updated_at']),
//       createdAt: DateTime.parse(json['created_at']),
//       id: json['id'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'email': email,
//       'mobile_no': mobileNo,
//       'updated_at': updatedAt.toIso8601String(),
//       'created_at': createdAt.toIso8601String(),
//       'id': id,
//     };
//   }
// }
