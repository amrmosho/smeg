import 'package:Smeg/app_components/text.dart';
import 'package:flutter/material.dart';
import 'package:Smeg/constants.dart';
import 'package:Smeg/ins/data_types.dart';

const double INSBTNDefaultTextSize = 15;
const double INSBTNDefaultIconSize = 15;
const Color INSBTNDefaultIconColor = INSAccentColor;
const Color INSBTNDefaultTextColor = INSAccentColor;
const Color INSBTNDefaultBackground = INSPrimaryColor;
const double INSBTNBorderRaduus = 15;

class INSButton extends StatelessWidget {
  final ButtonData button;
  final Function onclick;
  final Color icon_color;
  final double icon_size;
  final double text_size;
  final Color text_color;
  final Color background;
  final double border_radius;

  const INSButton(this.button,
      {this.onclick,
      this.icon_size,
      this.text_size,
      this.icon_color,
      this.text_color,
      this.background,
      this.border_radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: background == null ? INSBTNDefaultBackground : background,
          borderRadius: BorderRadius.all(Radius.circular(
              border_radius == null ? INSBTNBorderRaduus : border_radius))),
      child: Padding(
        padding: const EdgeInsets.only(right: 0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: Icon(
                    this.button.icon,
                    size: icon_size == null ? INSBTNDefaultIconSize : icon_size,
                    color: icon_color == null
                        ? INSBTNDefaultTextColor
                        : icon_color,
                  ),
                  onPressed: onclick,
                ),
                INSSubTitle(
                  text: this.button.title,
                  color:
                      text_color == null ? INSBTNDefaultTextColor : text_color,
                  fontsize:
                      text_size == null ? INSBTNDefaultTextSize : text_size,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
