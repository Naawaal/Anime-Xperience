class GetSearchAnimeModel {
  int? currentPage;
  bool? hasNextPage;
  List<Results>? results;

  GetSearchAnimeModel({this.currentPage, this.hasNextPage, this.results});

  GetSearchAnimeModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    hasNextPage = json['hasNextPage'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['hasNextPage'] = hasNextPage;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? id;
  String? title;
  String? image;
  String? releaseDate;
  String? subOrDub;

  Results({this.id, this.title, this.image, this.releaseDate, this.subOrDub});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    releaseDate = json['releaseDate'];
    subOrDub = json['subOrDub'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['releaseDate'] = releaseDate;
    data['subOrDub'] = subOrDub;
    return data;
  }
}
