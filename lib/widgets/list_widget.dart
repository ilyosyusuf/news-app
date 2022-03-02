import 'package:flutter/material.dart';
import 'package:lesson26/screens/second_page.dart';

class ListWidget extends StatefulWidget {
  List? futures;
  ListWidget({ Key? key,required this.futures}) : super(key: key);

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                    itemBuilder: (ctx, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            margin: EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(widget.futures![1]
                                            .articles![i].urlToImage
                                            .toString()),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 270,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.futures![1].articles![i].title.toString(),
                                          style: TextStyle(
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
                                                    Text(widget.futures![1]
                                                        .articles![i].source!.name
                                                        .toString()),
                                                    Icon(Icons.more_horiz),
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
                                  news: widget.futures![1].articles![i],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    itemCount: widget.futures![1].articles!.length,
                  );
  }
}