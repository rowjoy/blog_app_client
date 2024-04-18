class FavPostModel {
  String? favPostId;
  String? likedBy;
  String? likedAt;
  Post? post;

  FavPostModel({this.favPostId, this.likedBy, this.likedAt, this.post});

  FavPostModel.fromJson(Map<String, dynamic> json) {
    favPostId = json['favPostId'];
    likedBy = json['likedBy'];
    likedAt = json['likedAt'];
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favPostId'] = this.favPostId;
    data['likedBy'] = this.likedBy;
    data['likedAt'] = this.likedAt;
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    return data;
  }
}

class Post {
  String? postContent;
  String? postStatus;
  String? currentAmount;
  bool? isCompleted;
  String? aboutProduct1;
  String? aboutProduct2;
  String? aboutProduct3;
  String? aboutProduct4;
  String? aboutProduct5;
  String? aboutMarket1;
  String? aboutMarket2;
  String? aboutMarket3;
  String? aboutMarket4;
  String? aboutMarket5;
  String? aboutSales1;
  String? aboutSales2;
  String? aboutSales3;
  String? aboutSales4;
  String? aboutSales5;
  String? businessPlan1;
  String? businessPlan2;
  String? businessPlan3;
  String? businessPlan4;
  String? businessPlan5;
  String? investmentPlan1;
  String? investmentPlan2;
  String? investmentPlan3;
  String? investmentPlan4;
  String? investmentPlan5;
  String? aboutTeam1;
  String? aboutTeam2;
  String? aboutTeam3;
  String? aboutTeam4;
  String? aboutTeam5;
  String? futurePlan1;
  String? futurePlan2;
  String? futurePlan3;
  String? futurePlan4;
  String? futurePlan5;
  String? faq1;
  String? faq2;
  String? faq3;
  String? faq4;
  String? faq5;
  String? faqA1;
  String? faqA2;
  String? faqA3;
  String? faqA4;
  String? faqA5;
  String? createdAt;
  String? updatedAt;
  Author? author;

  Post(
      {this.postContent,
      this.postStatus,
      this.currentAmount,
      this.isCompleted,
      this.aboutProduct1,
      this.aboutProduct2,
      this.aboutProduct3,
      this.aboutProduct4,
      this.aboutProduct5,
      this.aboutMarket1,
      this.aboutMarket2,
      this.aboutMarket3,
      this.aboutMarket4,
      this.aboutMarket5,
      this.aboutSales1,
      this.aboutSales2,
      this.aboutSales3,
      this.aboutSales4,
      this.aboutSales5,
      this.businessPlan1,
      this.businessPlan2,
      this.businessPlan3,
      this.businessPlan4,
      this.businessPlan5,
      this.investmentPlan1,
      this.investmentPlan2,
      this.investmentPlan3,
      this.investmentPlan4,
      this.investmentPlan5,
      this.aboutTeam1,
      this.aboutTeam2,
      this.aboutTeam3,
      this.aboutTeam4,
      this.aboutTeam5,
      this.futurePlan1,
      this.futurePlan2,
      this.futurePlan3,
      this.futurePlan4,
      this.futurePlan5,
      this.faq1,
      this.faq2,
      this.faq3,
      this.faq4,
      this.faq5,
      this.faqA1,
      this.faqA2,
      this.faqA3,
      this.faqA4,
      this.faqA5,
      this.createdAt,
      this.updatedAt,
      this.author});

  Post.fromJson(Map<String, dynamic> json) {
    postContent = json['postContent'];
    postStatus = json['postStatus'];
    currentAmount = json['currentAmount'];
    isCompleted = json['isCompleted'];
    aboutProduct1 = json['AboutProduct1'];
    aboutProduct2 = json['AboutProduct2'];
    aboutProduct3 = json['AboutProduct3'];
    aboutProduct4 = json['AboutProduct4'];
    aboutProduct5 = json['AboutProduct5'];
    aboutMarket1 = json['AboutMarket1'];
    aboutMarket2 = json['AboutMarket2'];
    aboutMarket3 = json['AboutMarket3'];
    aboutMarket4 = json['AboutMarket4'];
    aboutMarket5 = json['AboutMarket5'];
    aboutSales1 = json['AboutSales1'];
    aboutSales2 = json['AboutSales2'];
    aboutSales3 = json['AboutSales3'];
    aboutSales4 = json['AboutSales4'];
    aboutSales5 = json['AboutSales5'];
    businessPlan1 = json['BusinessPlan1'];
    businessPlan2 = json['BusinessPlan2'];
    businessPlan3 = json['BusinessPlan3'];
    businessPlan4 = json['BusinessPlan4'];
    businessPlan5 = json['BusinessPlan5'];
    investmentPlan1 = json['InvestmentPlan1'];
    investmentPlan2 = json['InvestmentPlan2'];
    investmentPlan3 = json['InvestmentPlan3'];
    investmentPlan4 = json['InvestmentPlan4'];
    investmentPlan5 = json['InvestmentPlan5'];
    aboutTeam1 = json['AboutTeam1'];
    aboutTeam2 = json['AboutTeam2'];
    aboutTeam3 = json['AboutTeam3'];
    aboutTeam4 = json['AboutTeam4'];
    aboutTeam5 = json['AboutTeam5'];
    futurePlan1 = json['FuturePlan1'];
    futurePlan2 = json['FuturePlan2'];
    futurePlan3 = json['FuturePlan3'];
    futurePlan4 = json['FuturePlan4'];
    futurePlan5 = json['FuturePlan5'];
    faq1 = json['faq1'];
    faq2 = json['faq2'];
    faq3 = json['faq3'];
    faq4 = json['faq4'];
    faq5 = json['faq5'];
    faqA1 = json['faqA1'];
    faqA2 = json['faqA2'];
    faqA3 = json['faqA3'];
    faqA4 = json['faqA4'];
    faqA5 = json['faqA5'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postContent'] = this.postContent;
    data['postStatus'] = this.postStatus;
    data['currentAmount'] = this.currentAmount;
    data['isCompleted'] = this.isCompleted;
    data['AboutProduct1'] = this.aboutProduct1;
    data['AboutProduct2'] = this.aboutProduct2;
    data['AboutProduct3'] = this.aboutProduct3;
    data['AboutProduct4'] = this.aboutProduct4;
    data['AboutProduct5'] = this.aboutProduct5;
    data['AboutMarket1'] = this.aboutMarket1;
    data['AboutMarket2'] = this.aboutMarket2;
    data['AboutMarket3'] = this.aboutMarket3;
    data['AboutMarket4'] = this.aboutMarket4;
    data['AboutMarket5'] = this.aboutMarket5;
    data['AboutSales1'] = this.aboutSales1;
    data['AboutSales2'] = this.aboutSales2;
    data['AboutSales3'] = this.aboutSales3;
    data['AboutSales4'] = this.aboutSales4;
    data['AboutSales5'] = this.aboutSales5;
    data['BusinessPlan1'] = this.businessPlan1;
    data['BusinessPlan2'] = this.businessPlan2;
    data['BusinessPlan3'] = this.businessPlan3;
    data['BusinessPlan4'] = this.businessPlan4;
    data['BusinessPlan5'] = this.businessPlan5;
    data['InvestmentPlan1'] = this.investmentPlan1;
    data['InvestmentPlan2'] = this.investmentPlan2;
    data['InvestmentPlan3'] = this.investmentPlan3;
    data['InvestmentPlan4'] = this.investmentPlan4;
    data['InvestmentPlan5'] = this.investmentPlan5;
    data['AboutTeam1'] = this.aboutTeam1;
    data['AboutTeam2'] = this.aboutTeam2;
    data['AboutTeam3'] = this.aboutTeam3;
    data['AboutTeam4'] = this.aboutTeam4;
    data['AboutTeam5'] = this.aboutTeam5;
    data['FuturePlan1'] = this.futurePlan1;
    data['FuturePlan2'] = this.futurePlan2;
    data['FuturePlan3'] = this.futurePlan3;
    data['FuturePlan4'] = this.futurePlan4;
    data['FuturePlan5'] = this.futurePlan5;
    data['faq1'] = this.faq1;
    data['faq2'] = this.faq2;
    data['faq3'] = this.faq3;
    data['faq4'] = this.faq4;
    data['faq5'] = this.faq5;
    data['faqA1'] = this.faqA1;
    data['faqA2'] = this.faqA2;
    data['faqA3'] = this.faqA3;
    data['faqA4'] = this.faqA4;
    data['faqA5'] = this.faqA5;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    return data;
  }
}

class Author {
  String? userId;
  String? firstName;
  String? lastName;

  Author({this.userId, this.firstName, this.lastName});

  Author.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }
}
