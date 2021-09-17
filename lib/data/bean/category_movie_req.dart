import 'package:movie_app/constant/api_constant.dart';

class CategoryMovieReq {
  String apiKey = ApiConstant.API_KEY;
  String catMovieId = "";
  String page = '1';

  CategoryMovieReq.empty(String cateMovieIds, int page) {
    this.apiKey = ApiConstant.API_KEY;
    this.catMovieId = cateMovieIds;
    this.page = page.toString();
  }

  CategoryMovieReq({this.apiKey, this.page});

  CategoryMovieReq.fromJson(Map<String, String> json) {
    apiKey = json['api_key'];
    catMovieId = json['with_genres'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, String> data = new Map<String, String>();
    data['api_key'] = this.apiKey;
    data['with_genres'] = this.catMovieId;
    data['page'] = this.page;
    return data;
  }
}
