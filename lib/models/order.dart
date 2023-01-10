import 'dart:convert';

class Order {
  final String userId;
  final String date;
  final String from;
  final String to;
  final String username;
  final String userphone;
  final String status;
  
  Order({
    required this.userId,
     required this.date,
      required this.from,
       required this.to,
    required this.username,
    required this.userphone,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'date' :date,
      'from' :from,
      'to' :to,
      'username':username,
      'userphone':userphone,
      'status': status
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      userId: map['userId'] ?? '',
      date: map['date']  ?? '',
      from: map['from']  ?? '',
      to: map['to']?? '',
      username: map['username']??'',
      userphone: map['userphone']  ?? '',
      status: map['status']??'',
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}