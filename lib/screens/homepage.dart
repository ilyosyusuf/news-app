import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson26/models/news_model.dart';
import 'package:lesson26/screens/second_page.dart';
import 'package:lesson26/services/news_service.dart';
import 'package:lesson26/widgets/elevatedbutton.dart';
import 'package:lesson26/widgets/future_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int current = 0;
  List _cat = ["News", "Currency", "World", "Politics", "Entertainment"];
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
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0, left: 10.0),
          child: SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  return MyElevetedButton(
                      currentPage: current,
                      onpressed: () {
                        setState(
                          () {
                            current = i;
                            
                          },
                        );
                      },
                      text: _cat[i],
                      index: i);
                },
                itemCount: _cat.length,
              )),
        ),
        Expanded(
          flex: 8,
          child: NewsWidget(curent: current,),
          
        ),
      ]),
    );
  }
}
