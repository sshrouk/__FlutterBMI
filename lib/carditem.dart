import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  CardItem({@required this.color, this.onPress, this.cardChild});

  final Color color;
  final Function onPress;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
