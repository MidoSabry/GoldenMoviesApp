import 'package:movie_app/constant/api_constant.dart';

class CommonMovieReq {
  String apiKey = ApiConstant.API_KEY;

  String page = '1';

  CommonMovieReq.empty() {
    this.apiKey = ApiConstant.API_KEY;
    this.page = '2';
  }

  CommonMovieReq.page(String page) {
    this.apiKey = ApiConstant.API_KEY;
    this.page = page;
  }

  CommonMovieReq({this.apiKey, this.page});

  CommonMovieReq.fromJson(Map<String, String> json) {
    apiKey = json['api_key'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, String> data = new Map<String, String>();
    data['api_key'] = this.apiKey;
    data['page'] = this.page;
    return data;
  }
}
