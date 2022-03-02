import 'package:flutter/material.dart';
import 'package:lesson26/screens/homepage.dart';
import 'package:lesson26/screens/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin{
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          MyHomePage(),
          SearchPage(),
          Container(),
        ],
      ),
      bottomNavigationBar: myTabbar,
    );
  }
  TabBar get myTabbar => TabBar(
    controller: _tabController,
    indicatorColor: Colors.green,
    unselectedLabelColor: Colors.black,
    labelColor: Colors.green,
    indicatorSize: TabBarIndicatorSize.label,
    padding: EdgeInsets.all(10.0),
    tabs: [
      Tab(icon: Icon(Icons.home_outlined)),
      Tab(icon: Icon(Icons.search)),
      Tab(icon: Icon(Icons.bookmark_outline)),
    ]
  );
}