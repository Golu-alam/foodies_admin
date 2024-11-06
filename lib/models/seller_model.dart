import 'dart:convert';


SellerModel sellerModelFromJson(String str) => SellerModel.fromJson(json.decode(str));

String sellerModelToJson(SellerModel data) => json.encode(data.toJson());

class SellerModel {
  String? sellerId;
  String? sellerName;
  String? sellerImage;
  String? sellerEmail;
  String? sellerPassword;
  bool? sellerStatus;
  String? sellerNumber;
  String? sellerAddress;
  String? sellerShopImage;
  // String? sellerShopAddress;
  // GeoPoint? location;
  String? timestamp;
  String? deviceToken;

  SellerModel({
    this.sellerId,
    this.sellerName,
    this.sellerImage,
    this.sellerEmail,
    this.sellerPassword,
    this.sellerStatus,
    this.sellerNumber,
    this.sellerAddress,
    this.sellerShopImage,
    // this.sellerShopAddress,
    // this.location,
    this.timestamp,
    this.deviceToken,
  });

  factory SellerModel.fromJson(Map<String, dynamic> json) => SellerModel(
    sellerId: json["sellerId"],
    sellerName: json["sellerName"],
    sellerImage: json["sellerImage"],
    sellerEmail: json["sellerEmail"],
    sellerPassword: json["sellerPassword"],
    sellerStatus: json["sellerStatus"],
    sellerNumber: json["sellerNumber"],
    sellerAddress: json["sellerAddress"],
    sellerShopImage: json["sellerShopImage"],
    // sellerShopAddress: json["sellerShopAddress"],
    // location: json["location"],
    timestamp: json["timestamp"],
    deviceToken: json["deviceToken"],
  );

  Map<String, dynamic> toJson() => {
    "sellerId": sellerId,
    "sellerName": sellerName,
    "sellerImage": sellerImage,
    "sellerEmail": sellerEmail,
    "sellerPassword": sellerPassword,
    "sellerStatus": sellerStatus,
    "sellerNumber": sellerNumber,
    "sellerAddress": sellerAddress,
    "sellerShopImage": sellerShopImage,
    // "sellerShopAddress": sellerShopAddress,
    // "location": location,
    "timestamp": timestamp,
    "deviceToken": deviceToken,
  };
}
