import 'package:flutter/material.dart';

import '../models/home_item.dart';
import '../../progress/progress_view.dart';

class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({Key? key, required this.item, required this.icon}) : super(key: key);

  final HomeItem item;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { 
        Navigator.of(context).pushNamed(ProgressView.routeName, arguments: item);
      },
      child: Container(
        decoration: BoxDecoration(
          color: item.color,
          borderRadius: const BorderRadius.all(Radius.circular(25))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Hero(
                  tag: item.title,
                  child: item.icon
                ),
              ),
              const SizedBox(height: 16),
              Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
              const SizedBox(height: 4),
              Text(
                item.subtitle,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
