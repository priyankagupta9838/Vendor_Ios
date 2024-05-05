class ShopDetailModel {
  List<Data>? data;

  ShopDetailModel({this.data});

  ShopDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? userId;
  String? shopName;
  String? shopLocation;
  String? uniquesness;
  List<PortfolioShop>? portfolioShop;
  PortfolioShop? shopCoverPhoto;
  PortfolioShop? docOne;
  PortfolioShop? docTwo;
  bool? termOne;
  bool? termTwo;
  bool? approve;
  int? iV;

  Data(
      {this.sId,
        this.userId,
        this.shopName,
        this.shopLocation,
        this.uniquesness,
        this.portfolioShop,
        this.shopCoverPhoto,
        this.docOne,
        this.docTwo,
        this.termOne,
        this.termTwo,
        this.approve,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    shopName = json['shopName'];
    shopLocation = json['shopLocation'];
    uniquesness = json['uniquesness'];
    if (json['portfolioShop'] != null) {
      portfolioShop = <PortfolioShop>[];
      json['portfolioShop'].forEach((v) {
        portfolioShop!.add(PortfolioShop.fromJson(v));
      });
    }
    shopCoverPhoto = json['shopCoverPhoto'] != null
        ? PortfolioShop.fromJson(json['shopCoverPhoto'])
        : null;
    docOne = json['docOne'] != null
        ? PortfolioShop.fromJson(json['docOne'])
        : null;
    docTwo = json['docTwo'] != null
        ? PortfolioShop.fromJson(json['docTwo'])
        : null;
    termOne = json['termOne'];
    termTwo = json['termTwo'];
    approve = json['approve'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['shopName'] = this.shopName;
    data['shopLocation'] = this.shopLocation;
    data['uniquesness'] = this.uniquesness;
    if (this.portfolioShop != null) {
      data['portfolioShop'] =
          this.portfolioShop!.map((v) => v.toJson()).toList();
    }
    if (this.shopCoverPhoto != null) {
      data['shopCoverPhoto'] = this.shopCoverPhoto!.toJson();
    }
    if (this.docOne != null) {
      data['docOne'] = this.docOne!.toJson();
    }
    if (this.docTwo != null) {
      data['docTwo'] = this.docTwo!.toJson();
    }
    data['termOne'] = this.termOne;
    data['termTwo'] = this.termTwo;
    data['approve'] = this.approve;
    data['__v'] = this.iV;
    return data;
  }
}

class PortfolioShop {
  String? filename;
  String? s3Key;
  String? url;
  String? sId;

  PortfolioShop({this.filename, this.s3Key, this.url, this.sId});

  PortfolioShop.fromJson(Map<String, dynamic> json) {
    filename = json['filename'];
    s3Key = json['s3Key'];
    url = json['url'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['filename'] = this.filename;
    data['s3Key'] = this.s3Key;
    data['url'] = this.url;
    data['_id'] = this.sId;
    return data;
  }
}