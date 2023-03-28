class UserCigInfo {
  int averagePackPrice;
  int cigsPerPack;
  int estimatedAveragePerDay;

  UserCigInfo({this.averagePackPrice = 0, this.cigsPerPack = 0, this.estimatedAveragePerDay = 0});

  Map<String, String> toMap() {
    return {
      'averagePackPrice': averagePackPrice.toString(),
      'cigsPerPack': cigsPerPack.toString(),
      'estimatedAveragePerDay': estimatedAveragePerDay.toString(),
    };
  }
}


class User {
  String username;
  String password;
  String email;
  String usernameEmail;
  UserCigInfo userCigInfo;

  User({required this.username, required this.password, required this.email, this.usernameEmail = "", required this.userCigInfo});

  Map<String, dynamic> toMap() {
    return {'username': username, 'password': password, 'email': email, 'usernameEmail':usernameEmail, 'userCigInfo':UserCigInfo};
  }
}

