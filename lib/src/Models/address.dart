import 'dart:convert';

import 'city.dart';
import 'phone.dart';

class Address {
  final String street;
  final int? number;
  final String zipCode;
  final City city;
  final Phone phone;
  Address({
    required this.street,
    required this.number,
    required this.zipCode,
    required this.city,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'street': street});
    result.addAll({'number': number});
    result.addAll({'zipCode': zipCode});
    result.addAll({'city': city.toMap()});
    result.addAll({'phone': phone.toMap()});

    return result;
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'] ?? '',
      number: map['number'] ?? 0,
      zipCode: map['zipCode'] ?? '',
      city: City.fromMap(map['city'] ?? <String, dynamic>{}),
      phone: Phone.fromMap(map['phone'] ?? <String, dynamic>{}),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(jsonDecode(source));
}
