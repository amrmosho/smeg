import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    this.size,
    this.hint,
  }) : super(key: key);

  final Size size;
  final String hint;
  @override
  Widget build(BuildContext context) {
    Size _size;
    _size = (size == null) ? MediaQuery.of(context).size : size;

    return Container(
      margin: EdgeInsets.only(bottom: kDefultpadding * 2.5),
      height: 50,
      child: Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFFf5f5f5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 3,
                color: Colors.white,
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(Icons.search),
              ),
              Expanded(
                child: TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: this.hint == null ? "Search..." : this.hint,
                    hintStyle: TextStyle(
                      color: kTextColor.withOpacity(0.5),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    // surffix isn't working properly  with SVG
                    // thats why we use row
                    // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                  ),
                ),
              ),
              Icon(Icons.mic)
            ],
          ),
        ),
      ),
    );
  }
}
