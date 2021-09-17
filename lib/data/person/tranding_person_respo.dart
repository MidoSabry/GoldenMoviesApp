class TrandingPersonRespo {
  int page;
  List<Results> results;
  int total_pages;
  int totalResults;

  TrandingPersonRespo(
      {this.page, this.results, this.total_pages, this.totalResults});

  TrandingPersonRespo.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
    total_pages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.total_pages;
    data['total_results'] = this.totalResults;
    return data;
  }
}

class Results {
  bool adult;
  int gender;
  String name;
  int id;
  String knownForDepartment;
  String profilePath;
  double popularity;
  String mediaType;

  Results(
      {this.adult,
      this.gender,
      this.name,
      this.id,
      this.knownForDepartment,
      this.profilePath,
      this.popularity,
      this.mediaType});

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    name = json['name'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    profilePath = json['profile_path'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['gender'] = this.gender;
    data['name'] = this.name;
    data['id'] = this.id;
    data['known_for_department'] = this.knownForDepartment;
    data['profile_path'] = this.profilePath;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}
