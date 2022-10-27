import 'package:flutter/material.dart';

class DotDivider extends StatelessWidget {
  const DotDivider({
    Key? key,
    this.radius = 8,
    this.color,
    this.direction,
    this.divide = 3,
  }) : super(key: key);

  final int divide;
  final double radius;
  final Color? color;
  final Axis? direction;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (divide * radius)).floor();
        final defaultColor = Theme.of(context).dividerColor;
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: direction ?? Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                color: color ?? defaultColor,
                shape: BoxShape.circle,
              ),
            );
          }),
        );
      },
    );
  }
}
