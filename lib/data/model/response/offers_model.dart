import 'dart:convert';

OfferModel offerModelFromJson(String str) => OfferModel.fromJson(json.decode(str));

String offerModelToJson(OfferModel data) => json.encode(data.toJson());

class OfferModel {
  int? id;
  String? title;
  String? subTitle;
  String? type;

  String? offer;
  String? image;
  String? offerCode;

  OfferModel({
    this.id,
    this.title,
    this.subTitle,
    this.type,
    this.offer,
    this.image,
    this.offerCode,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
    id: json["id"],
    title: json["title"],
    subTitle: json["sub_title"],
    type: json["type"],
    offer: json["offer"],
    image: json["image"],
    offerCode: json["offer_code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "sub_title": subTitle,
    "type":type,
    "offer": offer,
    "image": image,
    "offer_code": offerCode,
  };
}