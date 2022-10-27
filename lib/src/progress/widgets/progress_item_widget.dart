import 'package:flutter/material.dart';

class ProgressItemWidget extends StatefulWidget {
  const ProgressItemWidget({super.key, required this.title, this.subtitle});

  final String title;
  final String? subtitle;

  @override
  State<ProgressItemWidget> createState() => _ProgressItemWidgetState();
}

class _ProgressItemWidgetState extends State<ProgressItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            widget.title,
            maxLines: 1,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            widget.subtitle ?? "",
            maxLines: 1,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
