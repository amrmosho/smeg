import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/data_types.dart';

class ImagesSlide extends StatefulWidget {
  final Content product;

  const ImagesSlide({Key key, this.product}) : super(key: key);

  @override
  _ImagesSlideState createState() => _ImagesSlideState(product);
}

class _ImagesSlideState extends State<ImagesSlide> {
  final Content product;
  int currentPage = 1;
  _ImagesSlideState(this.product);

  Container slideImage(String img) {
    return Container(
      child: Image.asset(
        img,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  List<Widget> dashs;
  List<Widget> myimages;
  @override
  Widget build(BuildContext context) {
    myimages = List();
    dashs = List();

    if (product.images != null) {
      int ind = 0;
      for (String img in this.product.images.split(",")) {
        myimages.add(
          slideImage(img),
        );
        dashs.add(
          Container(
            height: 5,
            width: (currentPage == ind) ? 40 : 20,
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: (currentPage == ind) ? Colors.white : INSPrimaryColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 3))
              ],
            ),
          ),
        );
        ind++;
      }
    }

    return Column(children: [
      Expanded(
        child: Hero(
          tag: "${product.id}",
          child: this.product.images == null
              ? Image.asset(
                  this.product.image,
                  fit: BoxFit.fill,
                )
              : PageView(
                  controller: PageController(),
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  children: myimages),
        ),
      ),
      Container(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dashs,
        ),
      )
    ]);
  }
}
