import 'package:flutter/material.dart';
import 'package:lesson26/models/currency_model.dart';
import 'package:lesson26/models/news_model.dart';
import 'package:lesson26/screens/second_page.dart';
import 'package:lesson26/services/currency_service.dart';
import 'package:lesson26/services/news_service.dart';
import 'package:lesson26/widgets/currency_widget.dart';
import 'package:lesson26/widgets/list_widget.dart';

class NewsWidget extends StatefulWidget {
  int curent;
  NewsWidget({ Key? key, required this.curent }) : super(key: key);

  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
              future: Future.wait(
                [
                  CurrencyService.getCurrencies(),
                  // NewsService.getNews(),

                ]
              ),
              builder: (context, AsyncSnapshot snap) {
                if (!snap.hasData) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snap.hasError) {
                  return const Center(
                    child: Text("Error"),
                  );
                } else {
                  return

                  widget.curent == 0 ?
                    ListWidget(futures: snap.data): 
                    widget.curent == 1 ?
                    CurrencyWidget(futures: snap.data[0] as List<CurrencyModel>):
                    widget.curent == 2 ? 
                    Container(color: Colors.amber,): 
                    Container(color:Colors.green);
                }
              },
            );
  }
}