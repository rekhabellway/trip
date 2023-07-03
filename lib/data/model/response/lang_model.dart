import 'dart:convert';
LanguageTransModel languageModelFromJson(String str) => LanguageTransModel.fromJson(json.decode(str));

String languageModelToJson(LanguageTransModel data) => json.encode(data.toJson());

class LanguageTransModel {
  int? id;
  String? languageName;
  String? countryCode;
  String? languageCode;
  String? image;

  LanguageTransModel({
    this.id,
    this.languageName,
    this.countryCode,
    this.languageCode,
    this.image,
  });

  factory LanguageTransModel.fromJson(Map<String, dynamic> json) => LanguageTransModel(
    id: json["id"],
    languageName: json["languageName"],
    countryCode: json["countryCode"],
    languageCode: json["languageCode"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "languageName": languageName,
    "countryCode": countryCode,
    "languageCode": languageCode,
    "image": image,
  };
}
