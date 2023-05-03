class TvShowsVideoModel {
  String? link;
  String? name;
  String? time;

  String? image1;

  TvShowsVideoModel({this.link, this.name, this.time, this.image1});

  factory TvShowsVideoModel.fromJson(Map<dynamic, dynamic> json) {
    return TvShowsVideoModel(
      link: json['link'] as String?,
      name: json['name'] as String?,
      time: json['time'] as String?,
      image1: json['image1'] as String?,
    );
  }
}
