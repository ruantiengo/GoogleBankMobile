class KeyPix {
  String type;
  String value;

  KeyPix({required this.type, required this.value});

  factory KeyPix.fromJson(Map<String, dynamic> json) {
    return KeyPix(
      type: json['type'] as String,
      value: json['value'] as String,
    );
  }
}
