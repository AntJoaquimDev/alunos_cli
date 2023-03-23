import 'dart:convert';

import 'city.dart';
import 'phone.dart';

class Address {
  String rua;
  int? numero;
  String cep;
  City city;
  Phone phone;
  Address({
    required this.rua,
    required this.numero,
    required this.cep,
    required this.city,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'rua': rua});
    result.addAll({'numero': numero});
    result.addAll({'CEP': cep});
    result.addAll({'city': city.toMap()});
    result.addAll({'phone': phone.toMap()});

    return result;
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      rua: map['rua'] ?? '',
      numero: map['numero'] ?? 0,
      cep: map['CEP'] ?? '',
      city: City.fromMap(map['city']),
      phone: Phone.fromMap(map['phone']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));
}
