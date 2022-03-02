import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants{
  static String myApiKey = dotenv.env["API_KEY"]!;
  static String myApi = "https://newsapi.org/v2/everything?q=tesla&from=2022-02-01&sortBy=publishedAt&apiKey=$myApiKey";
}