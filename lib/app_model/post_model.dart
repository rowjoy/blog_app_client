class mainPostModel {
  String? postId;
  String? postTitle;
  String? postUrl;
  String? postThumbnailUrl;
  String? postSubTitle;
  String? postType;
  String? targetPrice;
  String? targetEquity;
  String? postCategory;
  String? authorId;
  String? authorFullName;
  String? authorAvatarUrl;
  int? donatedBy;

  mainPostModel(
      {this.postId,
      this.postTitle,
      this.postUrl,
      this.postThumbnailUrl,
      this.postSubTitle,
      this.postType,
      this.targetPrice,
      this.targetEquity,
      this.postCategory,
      this.authorId,
      this.authorFullName,
      this.authorAvatarUrl,
      this.donatedBy});

  mainPostModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    postTitle = json['postTitle'];
    postUrl = json['postUrl'];
    postThumbnailUrl = json['postThumbnailUrl'];
    postSubTitle = json['postSubTitle'];
    postType = json['postType'];
    targetPrice = json['targetPrice'];
    targetEquity = json['targetEquity'];
    postCategory = json['postCategory'];
    authorId = json['authorId'];
    authorFullName = json['authorFullName'];
    authorAvatarUrl = json['authorAvatarUrl'];
    donatedBy = json['donatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['postTitle'] = this.postTitle;
    data['postUrl'] = this.postUrl;
    data['postThumbnailUrl'] = this.postThumbnailUrl;
    data['postSubTitle'] = this.postSubTitle;
    data['postType'] = this.postType;
    data['targetPrice'] = this.targetPrice;
    data['targetEquity'] = this.targetEquity;
    data['postCategory'] = this.postCategory;
    data['authorId'] = this.authorId;
    data['authorFullName'] = this.authorFullName;
    data['authorAvatarUrl'] = this.authorAvatarUrl;
    data['donatedBy'] = this.donatedBy;
    return data;
  }
}
