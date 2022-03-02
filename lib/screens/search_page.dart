import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson26/models/news_model.dart';
import 'package:lesson26/screens/second_page.dart';
import 'package:lesson26/services/news_service.dart';
import 'package:lesson26/widgets/elevatedbutton.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int current = 0;
  // List _cat = ["For You", "Top", "World", "Politics", "Entertainment"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/icons/title.svg'),
            ),
          ),
          const Padding (
            padding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
            child: CupertinoSearchTextField(),
          ),
          Expanded(
            flex: 8,
            child: FutureBuilder(
              future: NewsService.getNews(),
              builder: (context, AsyncSnapshot<NewsModel> snap) {
                if (!snap.hasData) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snap.hasError) {
                  return const Center(
                    child: Text("Error"),
                  );
                } else {
                  var data = snap.data;
                  return ListView.builder(
                    itemBuilder: (ctx, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            margin: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(data!
                                            .articles![i].urlToImage
                                            .toString()),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 270,
                                    margin:
                                        const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.articles![i].title.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        // Text(
                                        //   "By ${data.articles![i].author}",
                                        //   style: TextStyle(color: Colors.grey),
                                        // ),
                                        Container(
                                          width: double.infinity,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 220,
                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(data
                                                        .articles![i].source!.name
                                                        .toString()),
                                                    const Icon(Icons.more_horiz),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => SecondPage(
                                  news: data.articles![i],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    itemCount: data!.articles!.length,
                  );
                }
              },
            ),
          ),
        ]),
    );
  }
}