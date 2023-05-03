class NewsModel {
  String? category;
  String? name;
  String? time;
  String? des;
  String? image1;

  NewsModel({this.category, this.name, this.time, this.des, this.image1});

  factory NewsModel.fromJson(Map<dynamic, dynamic> json) {
    return NewsModel(
      category: json['category'] as String?,
      name: json['name'] as String?,
      time: json['time'] as String?,
      des: json['des'] as String?,
      image1: json['image1'] as String?,
    );
  }
}
