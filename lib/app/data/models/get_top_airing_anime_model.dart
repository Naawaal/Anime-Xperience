class GetTopAiringAnimeModel {
  String? currentPage;
  bool? hasNextPage;
  List<Results>? results;

  GetTopAiringAnimeModel({this.currentPage, this.hasNextPage, this.results});

  GetTopAiringAnimeModel.fromJson(Map<String, dynamic> json) {
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
  String? url;
  List<String>? genres;

  Results({this.id, this.title, this.image, this.url, this.genres});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    url = json['url'];
    genres = json['genres'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['url'] = url;
    data['genres'] = genres;
    return data;
  }
}
