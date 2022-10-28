import 'dart:math';

import 'package:flutter/material.dart';

class ProgressWeekWidget extends StatefulWidget {
  const ProgressWeekWidget({super.key});

  @override
  State<ProgressWeekWidget> createState() => _ProgressWeekWidgetState();
}

class _ProgressWeekWidgetState extends State<ProgressWeekWidget> {
  @override
  Widget build(BuildContext context) {
    final days = [];

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints.loose(const Size.fromWidth(400)),
        child: Row(
          children: days.map((e) {
            double fillHeight = Random().nextDouble();
            return Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) => Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: constraints.constrainHeight() * fillHeight,
                          width: 8,
                          decoration: BoxDecoration(
                            color: Theme.of(context).dividerColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(e),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
