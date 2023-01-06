import 'dart:convert';

class Admin {
  final String id;
  final String email;
  final String password;
  final String token;
  

  Admin({
   required this.id,
   required this.email,
   required this.password,
   required this.token, 
   });

   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'token' : token,
    };

   }

   factory Admin.fromMap(Map<String, dynamic> map){
    return Admin(
      id: map['_id']?? '',
      email: map['email']?? '',
      password: map['password']?? '',
      token: map['token']?? '',

    );
   }

   String toJson() => json.encode(toMap());

   factory Admin.fromJson(String source) => Admin.fromMap(json.decode(source));
  

}