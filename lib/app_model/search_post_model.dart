class SearchPostModel {
  String? postId;
  String? postTitle;
  String? authorId;
  String? authorFullName;

  SearchPostModel(
      {this.postId, this.postTitle, this.authorId, this.authorFullName});

  SearchPostModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    postTitle = json['postTitle'];
    authorId = json['authorId'];
    authorFullName = json['authorFullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['postTitle'] = this.postTitle;
    data['authorId'] = this.authorId;
    data['authorFullName'] = this.authorFullName;
    return data;
  }
}
