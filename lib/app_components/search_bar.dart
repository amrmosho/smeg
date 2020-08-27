import 'package:flutter/material.dart';
import 'package:Smeg/constants.dart';
import 'package:Smeg/ins/lang.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    this.size,
    this.hint,
    this.onChanged,
    this.textSearcController,
  }) : super(key: key);

  final Size size;
  final Function onChanged;
  final TextEditingController textSearcController;

  final String hint;
  @override
  Widget build(BuildContext context) {
    Size _size;
    _size = (size == null) ? MediaQuery.of(context).size : size;

    return Container(
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
              controller: textSearcController,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: this.hint == null
                    ? INSLang.get("searchin") + "..."
                    : this.hint,
                hintStyle: TextStyle(
                  color: kTextColor.withOpacity(0.5),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.mic)
        ],
      ),
    );
  }
}
