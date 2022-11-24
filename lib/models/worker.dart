import 'dart:convert';

import 'package:flutter_try/models/rating.dart';

class Worker {
  final String id;
  final String email;
  final String name;
  final String password;
  final String phone;
  final String type;
  final String discreption ;
  final List<String> images ;
  final double price ;
  final String location;
  final List<Rating>?rating;

  final String token;

  Worker({
   required this.id,
   required this.email,
   required this.name, 
   required this.password,
   required this.phone,
   required this.type,
   required this.discreption,
   required this.images,
   required this.price,
   required this.location,
   this.rating,
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
      'discreption' : discreption,
      'images' : images,
      'price' : price,
      'location' : location,
      'rating' : rating,

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
      discreption: map['discreption']??'',
      images: List<String>.from(map['images']),
      price: map['price']?.toDouble() ?? 0.0,
      location: map['location']??'',
      rating: map['ratings'] != null
          ? List<Rating>.from(
              map['ratings']?.map(
                (x) => Rating.fromMap(x),
              ),
            )
          : null,

      token: map['token']?? '', 


    );
   }

   String toJson() => json.encode(toMap());

   factory Worker.fromJson(String source) => Worker.fromMap(json.decode(source));
  

}