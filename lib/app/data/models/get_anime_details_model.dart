class GetAnimeDetailsModel {
  String? id;
  String? title;
  String? url;
  String? image;
  String? releaseDate;
  String? description;
  List<String>? genres;
  String? subOrDub;
  String? type;
  String? status;
  String? otherName;
  int? totalEpisodes;
  List<Episodes>? episodes;

  GetAnimeDetailsModel(
      {this.id,
      this.title,
      this.url,
      this.image,
      this.releaseDate,
      this.description,
      this.genres,
      this.subOrDub,
      this.type,
      this.status,
      this.otherName,
      this.totalEpisodes,
      this.episodes});

  GetAnimeDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    image = json['image'];
    releaseDate = json['releaseDate'];
    description = json['description'];
    genres = json['genres'].cast<String>();
    subOrDub = json['subOrDub'];
    type = json['type'];
    status = json['status'];
    otherName = json['otherName'];
    totalEpisodes = json['totalEpisodes'];
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(Episodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['image'] = image;
    data['releaseDate'] = releaseDate;
    data['description'] = description;
    data['genres'] = genres;
    data['subOrDub'] = subOrDub;
    data['type'] = type;
    data['status'] = status;
    data['otherName'] = otherName;
    data['totalEpisodes'] = totalEpisodes;
    if (episodes != null) {
      data['episodes'] = episodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Episodes {
  String? id;
  int? number;
  String? url;

  Episodes({this.id, this.number, this.url});

  Episodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['number'] = number;
    data['url'] = url;
    return data;
  }
}
