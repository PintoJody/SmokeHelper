class CigUser {
  DateTime createdAt;

  CigUser({required this.createdAt});

  Map<String, dynamic> toMap() {
    return {'createdAt': createdAt};
  }
}