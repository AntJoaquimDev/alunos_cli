import 'dart:convert';

class Phone {
  String ddd;
  String phone;

  Phone({
    required this.ddd,
    required this.phone,
  });

// é um Construtor ele vai pegar um MAP e transformar em um objeto Phone
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'ddd': ddd});
    result.addAll({'phone': phone});

    return result;
  }

  factory Phone.fromMap(Map<String, dynamic> map) {
    return Phone(
      ddd: map['ddd'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Phone.fromJson(String source) => Phone.fromMap(json.decode(source));

  @override
  String toString() => 'Phone(ddd: $ddd, phone: $phone)';
}
