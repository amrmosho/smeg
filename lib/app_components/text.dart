import 'package:flutter/material.dart';
import 'package:Smeg/constants.dart';
import 'package:Smeg/ins/lang.dart';

class INSText extends StatelessWidget {
  final Widget child;

  const INSText({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: INSLang.isRTL() ? TextDirection.rtl : TextDirection.ltr,
        child: Container(
            padding: const EdgeInsets.only(
                left: kDefaultPadding, right: kDefaultPadding),
            width: double.infinity,
            child: child));
  }
}

class INSTText extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;

  const INSTText({@required this.text, this.fontsize, this.color});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: INSLang.isRTL() ? TextDirection.rtl : TextDirection.ltr,
        child: Container(
          padding: const EdgeInsets.only(
              left: kDefaultPadding, right: kDefaultPadding),
          width: double.infinity,
          child: Text(
            this.text,
            style: TextStyle(
              color: color == null ? INSDefultTextColor : color,
              fontSize: this.fontsize == null ? 12 : this.fontsize,
              fontFamily: INSLang.isRTL() ? "Cairo" : "OpenSans",
            ),
          ),
        ));
  }
}

class INSTitle extends StatelessWidget {
  final String text;
  const INSTitle({@required this.text});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: INSLang.isRTL() ? TextDirection.rtl : TextDirection.ltr,
      child: Text(
        this.text,
        style: Theme.of(context).textTheme.headline6.copyWith(
            color: INSDefultScreenTitleColor,
            fontFamily: INSLang.isRTL() ? "Cairo" : "OpenSans",
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class INSHeadLine extends StatelessWidget {
  final String text;
  const INSHeadLine({@required this.text});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: INSLang.isRTL() ? TextDirection.rtl : TextDirection.ltr,
      child: Text(
        this.text,
        style: Theme.of(context).textTheme.headline5.copyWith(
              color: INSDefultScreenTitleColor,
              fontFamily: INSLang.isRTL() ? "Cairo" : "OpenSans",
            ),
      ),
    );
  }
}

class INSSubTitle extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;

  const INSSubTitle({@required this.text, this.fontsize, this.color});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: INSLang.isRTL() ? TextDirection.rtl : TextDirection.ltr,
      child: Text(
        this.text,
        style: TextStyle(
          color: color == null ? INSDefultTextColor : color,
          fontSize: this.fontsize == null ? 12 : this.fontsize,
          fontFamily: INSLang.isRTL() ? "Cairo" : "OpenSans",
        ),
      ),
    );
  }
}
