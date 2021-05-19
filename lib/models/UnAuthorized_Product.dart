class UnAuthorizedProduct {
  String id;
  String isRevoked;
  String token;
  String name;
  String expiryDate;
  String companyId;
  String companyRegNo;
  String companyName;
  String companyPhoneNo;
  String companyEmail;

  UnAuthorizedProduct(
      {this.id = '',
      this.isRevoked = '',
      this.token = '',
      this.name = '',
      this.expiryDate = '',
      this.companyId = '',
      this.companyRegNo = '',
      this.companyName = '',
      this.companyPhoneNo = '',
      this.companyEmail});

  factory UnAuthorizedProduct.fromJson(Map<String, dynamic> json) {
    return UnAuthorizedProduct(
        id: json['_id'],
        isRevoked: json['isRevoked'].toString(),
        token: json['token'],
        name: json['name'],
        expiryDate: json['expiry'],
        companyId: json['companyId']['_id'],
        companyRegNo: json['companyId']['regno'],
        companyName: json['companyId']['name'],
        companyEmail: json['companyId']['email'],
        companyPhoneNo: json['companyId']['phonenumber'].toString());
  }

  Map toOffline(UnAuthorizedProduct UnAuthorizedProduct) {
    var map = Map<String, dynamic>();
    map['id'] = UnAuthorizedProduct.id;
    map['isRevoked'] = UnAuthorizedProduct.isRevoked;
    map['token'] = UnAuthorizedProduct.token;
    map['name'] = UnAuthorizedProduct.name;
    map["expiryDate"] = UnAuthorizedProduct.expiryDate;
    map["companyId"] = UnAuthorizedProduct.companyId;
    map["companyRegNo"] = UnAuthorizedProduct.companyRegNo;
    map["companyName"] = UnAuthorizedProduct.companyName;
    map["companyEmail"] = UnAuthorizedProduct.companyEmail;
    map["companyPhoneNo"] = UnAuthorizedProduct.companyPhoneNo;

    return map;
  }

  UnAuthorizedProduct.fromOffline(Map<String, dynamic> map) {
    this.id = map['id'];
    this.isRevoked = map['isRevoked'];
    this.token = map['token'];
    this.name = map['name'];
    this.expiryDate =map['expiryDate'].split('T')[0].trim();
    this.companyId = map['companyId'];
    this.companyRegNo = map['companyRegNo'];
    this.companyName = map['companyName'];
    this.companyEmail = map['companyEmail'];
    this.companyPhoneNo = map['companyPhoneNo'];
  }

    static DateTime getDateIntoDateTimeFormat(String date) {
    return DateTime.parse(date);
  }

 static String formattedDateTimeIntoString(DateTime date) {
    return date.toIso8601String().split('T')[0].trim();
  }


  static int getAgeInYear(String dateOfBirth) {
    int age = 0;
    try {
      DateTime currentDate = DateTime.now();
      DateTime birthDate = dateOfBirth != null && dateOfBirth != ''
          ? getDateIntoDateTimeFormat(dateOfBirth)
          : getDateIntoDateTimeFormat(formattedDateTimeIntoString(currentDate));
      age = currentDate.year - birthDate.year;
      if (birthDate.month > currentDate.month) {
        age--;
      } else if (birthDate.month == currentDate.month) {
        if (birthDate.day > currentDate.day) {
          age--;
        }
      }
    } catch (e) {}
    return age;
  }

  bool checkExpiration(String date, bool isRevoked) {}
}
