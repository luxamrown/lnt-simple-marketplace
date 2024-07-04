class Profile {
  String? id;
  String? email;
  String? password;
  String? fullname;
  String? telNum;

  Profile({
    this.id,
    this.email,
    this.password,
    this.fullname,
    this.telNum
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'fullname': fullname,
      'telNum': telNum
    };
  }
}