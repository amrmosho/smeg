import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/net.dart';
import 'package:shop_app/models/products.dart';

class ImagesSlide extends StatefulWidget {
  final Product product;

  const ImagesSlide({Key key, this.product}) : super(key: key);

  @override
  _ImagesSlideState createState() => _ImagesSlideState(product);
}

class _ImagesSlideState extends State<ImagesSlide> {
  final Product product;
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
          child: INSNet.getImage(this.product.image, heroTag: this.product.id)),
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
