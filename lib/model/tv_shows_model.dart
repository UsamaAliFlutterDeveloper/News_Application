class TvShowsModel {
  String? name;
  String? image1;

  TvShowsModel({this.name, this.image1});

  factory TvShowsModel.fromJson(Map<dynamic, dynamic> json) {
    return TvShowsModel(
      name: json['name'] as String?,
      image1: json['image1'] as String?,
    );
  }
}
