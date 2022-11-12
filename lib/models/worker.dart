import 'dart:convert';

class Worker {
  final String id;
  final String email;
  final String name;
  final String password;
  final String phone;
  final String type;
  final String token;

  Worker({
   required this.id,
   required this.email,
   required this.name, 
   required this.password,
   required this.phone,
   required this.type,
   required this.token, 
   });

   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'password': password,
      'phone': phone,
      'type' : type,

      'token' : token,

    };

   }

   factory Worker.fromMap(Map<String, dynamic> map){
    return Worker(
      id: map['_id']?? '',
      email: map['email']?? '',
      name: map['name']?? '',
      password: map['password']?? '',
      phone: map['phone']?? '',
      type: map['type']?? '',
      token: map['token']?? '', 

    );
   }

   String toJson() => json.encode(toMap());

   factory Worker.fromJson(String source) => Worker.fromMap(json.decode(source));
  

}