class User {
   String id;
   String firstname;
   String lastname;
   String email;
   String phonenumber;
   String gender;

  User(
      {this.id =" " ,
      this.firstname = "",
      this.lastname= "",
      this.email ="",
      this.phonenumber ="",
      this.gender = ""});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      firstname: json['firstName'],
      lastname: json['lastName'],
      email: json['email'],
      phonenumber: json['phoneNumber'],
      gender: json['gender'],
    );
  }

  Map toOffline(User user) {
    var map = Map<String, dynamic>();
    map['id'] = user.id;
    map['firstName'] = user.firstname;
    map['lastName'] = user.lastname;
    map['email'] = user.email;
    map["phoneNumber"] = user.phonenumber;
    map["gender"] = user.gender;

    return map;
  }

  User.fromOffline(Map<String, dynamic> map) {
    this.id = map['id'];
    this.firstname = map['firstName'];
    this.lastname = map['lastName'];
    this.email = map['email'];
    this.phonenumber = map['phoneNumber'];
    this.gender = map['gender'];

  }

  @override
  String toString() {
    return 'name : $firstname, id : $id';
  }
}
