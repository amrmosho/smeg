import 'package:Smeg/app_components/text.dart';
import 'package:flutter/material.dart';
import 'package:Smeg/Screens/homeScreens/news/newsitem.dart';
import 'package:Smeg/app_components/main_body.dart';
import 'package:Smeg/constants.dart';
import 'package:Smeg/ins/net.dart';
import 'package:Smeg/models/content.dart';

class NewsScreen extends StatefulWidget {
  static String id = "news";
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

List<Content> contents = List();

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();

    Content.get((data) {
      setState(() {
        contents = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: AppBody(
          child: Container(
            padding: EdgeInsets.only(bottom: 34),
            child: ListView.builder(
              itemCount: contents.length,
              itemBuilder: (context, index) {
                return newsItem(index);
              },
            ),
          ),
        ),
      ),
    );
  }

  Container newsItem(int index) {
    return Container(
      margin: EdgeInsets.all(INSDefultpadding / 2),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(25)),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return NewsItemSreen(content: contents[index]);
              },
            ));
          },
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.dstATop),
                  child: INSNet.getImage(contents[index].image,
                      heroTag: contents[index].id,
                      padding: 0,
                      fit: BoxFit.cover),
                ),
              ),
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: INSSubTitle(
                        text: contents[index].title,
                        color: Colors.white,
                        fontsize: 20,
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        Icon(Icons.date_range,
                            color: Colors.white.withOpacity(0.7)),
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: INSSubTitle(
                              text: contents[index].sys_created,
                              color: Colors.white,
                              fontsize: 15,
                            )),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
