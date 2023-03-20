class User {
  String username;
  String password;
  String email;
  String usernameEmail;

  User({required this.username, required this.password, required this.email, this.usernameEmail = ""});

  Map<String, String> toMap() {
    return {'username': username, 'password': password, 'email': email, 'usernameEmail':usernameEmail};
  }
}

