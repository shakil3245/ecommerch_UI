import 'package:craftybay/data/models/profile.dart';

class ReviewModel {
  String? msg;
  List<reviewData>? ReviewData;

  ReviewModel({this.msg, this.ReviewData});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      ReviewData = <reviewData>[];
      json['data'].forEach((v) {
        ReviewData!.add(new reviewData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.ReviewData != null) {
      data['data'] = this.ReviewData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class reviewData {
  int? id;
  String? description;
  String? email;
  int? productId;
  String? createdAt;
  String? updatedAt;
  Profile? profile;

  reviewData(
      {this.id,
        this.description,
        this.email,
        this.productId,
        this.createdAt,
        this.updatedAt,
        this.profile});

  reviewData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    email = json['email'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['email'] = email;
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

