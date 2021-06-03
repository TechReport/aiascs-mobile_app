class UnAuthorizedProduct {
  String id;
  String isRevoked;
  String name;
  String companyName;
  String descriptions;
  String photoUrl;

  UnAuthorizedProduct(
      {this.id = '',
      this.isRevoked = '',
      this.name = '',
      this.companyName = '',
      this.descriptions = '',
      this.photoUrl});

  factory UnAuthorizedProduct.fromJson(Map<String, dynamic> json) {
    return UnAuthorizedProduct(
        id: json['data']['_id'] ?? "",
        isRevoked: json['data']['isRevoked'].toString() ?? " ",
        name: json['data']['name'] ?? "",
        companyName: json['data']['name'] ?? "",
        descriptions: json['data']['descriptions'] ?? "",
        photoUrl: json['data']['photo'][0]['url'].toString() ?? "",
        );
  }

  Map toOffline(UnAuthorizedProduct UnAuthorizedProduct) {
    var map = Map<String, dynamic>();
    map['id'] = UnAuthorizedProduct.id;
    map['isRevoked'] = UnAuthorizedProduct.isRevoked;
    map['descriptions'] = UnAuthorizedProduct.descriptions;
    map['name'] = UnAuthorizedProduct.name;
    map['companyName'] = UnAuthorizedProduct.companyName;
    map['photoUrl'] = UnAuthorizedProduct.photoUrl;
    return map;
  }

  UnAuthorizedProduct.fromOffline(Map<String, dynamic> map) {
    this.id = map['id'];
    this.isRevoked = map['isRevoked'];
    this.descriptions = map['descriptions'];
    this.name = map['name'];
    this.companyName = map['companyName'];
    this.photoUrl = map['photoUrl'];
  }


 
}
