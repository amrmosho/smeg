import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Smeg/Screens/productScreens/details/components/cat_conter.dart';
import 'package:Smeg/models/favorite.dart';
import 'package:Smeg/models/products.dart';

class CounterAndFavBtn extends StatefulWidget {
  const CounterAndFavBtn({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _CounterAndFavBtnState createState() => _CounterAndFavBtnState();
}

class _CounterAndFavBtnState extends State<CounterAndFavBtn>
    with TickerProviderStateMixin {
  bool _iffav = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    Favorite.isExist(widget.product.id, onDone: (status) {
      setState(() {
        _iffav = status;
      });
    });
  }

  AnimationController _controller;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartCounter(product: widget.product),
        AnimatedBuilder(
            builder: (BuildContext context, Widget child) {
              return Transform.scale(
                scale: 1 + _controller.value,
                child: child,
              );
            },
            animation: _controller,
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _iffav ? Color(0xFFFF6464) : Colors.grey),
              child: GestureDetector(
                onTap: () {
                  Favorite.isExist(widget.product.id, onDone: (status) {
                    _controller.repeat(min: 1, max: 1);
                    _controller.reverse();
                    if (status) {
                      Favorite.remove(widget.product.id);
                      setState(() {
                        _iffav = false;
                      });
                    } else {
                      Favorite.add(widget.product.id);
                      setState(() {
                        _iffav = true;
                      });
                    }
                  });
                },
                child: SvgPicture.asset("assets/icons/heart.svg"),
              ),
            ))
      ],
    );
  }
}
