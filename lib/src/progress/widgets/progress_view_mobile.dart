import 'package:demo_remote_localization/app_localizations.dart';
import 'package:flutter/material.dart';

import '../progress_controller.dart';
import '../widgets/progress_item_widget.dart';
import '../widgets/progress_week_widget.dart';

import '../../widgets/circular_progress_indicator_rounded.dart';
import '../../widgets/dot_divider.dart';

class ProgressViewMobile extends StatelessWidget {
  const ProgressViewMobile({
    super.key,
    required this.controller,
  });

  static const _kProgressSize = 180.0;
  static const _kImageSize = 125.0;

  final ProgressController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: SizedBox(
                width: _kProgressSize,
                height: _kProgressSize,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (context, _) => CircularProgressIndicatorRounded(
                          strokeWidth: 12,
                          value: controller.progress,
                        ),
                      ),
                    ),
                    Center(
                      child: Hero(
                        tag: controller.item.title,
                        child: FlutterLogo()
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 36),
            Row(
              children: [
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, _) => ProgressItemWidget(
                    title: formatProgress(controller.progress),
                    subtitle: AppLocalizations(context).percent,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            AnimatedBuilder(
              animation: controller,
              builder: (context, _) => Slider(
                value: controller.progress,
                onChanged: (value) => controller.updateProgress(value),
              ),
            ),
            // const SizedBox(height: 12),
            const DotDivider(),
            const SizedBox(height: 18),
            const Expanded(child: ProgressWeekWidget()),
          ],
        );
  }

  String formatProgress(double value) {
    var progress = (value * 100).clamp(0, 100).toStringAsFixed(1);
    return "$progress%";
  }
}
