class KeyValueEntity<T> {

  KeyValueEntity({required this.key, required this.value});

  T key;
  String value;

  static KeyValueEntity<T> mapper<T>(Map<String, dynamic> response) => KeyValueEntity<T>(key: response["id"], value: response["value"]);

}