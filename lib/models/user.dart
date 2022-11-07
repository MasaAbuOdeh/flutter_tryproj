import 'dart:convert';

class User {
  final String id;
  final String email;
  final String name;
  final String password;
  final String phone;
  final String token;

  User({
   required this.id,
   required this.email,
   required this.name, 
   required this.password,
   required this.phone,
   required this.token,
   });

   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'password': password,
      'phone': phone,
      'token' : token,
    };

   }

   factory User.fromMap(Map<String, dynamic> map){
    return User(
      id: map['_id']?? '',
      email: map['email']?? '',
      name: map['name']?? '',
      password: map['password']?? '',
      phone: map['phone']?? '',
      token: map['token']?? '',

    );
   }

   String toJson() => json.encode(toMap());

   factory User.fromJson(String source) => User.fromMap(json.decode(source));
  

}