import 'package:dio/dio.dart';
import 'package:lesson26/core/api.dart';
import 'package:lesson26/models/news_model.dart';

class NewsService{
  static Future<NewsModel> getNews() async{
    Response res = await Dio().get(Constants.myApi);
    return NewsModel.fromJson(res.data);
  }
}