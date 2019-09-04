class Country {

  String name;
  String nativeName;
  String flag;
  String id;

  Country({this.name, this.flag, this.id,this.nativeName});

  factory Country.fromJson(Map<String, dynamic> json) {
    return new Country(
      name: json['catname'] as String,
      nativeName: json['catname'] as String,
      flag: json['img'] as String,
      id: json['id'] as String,
    );
  }
}