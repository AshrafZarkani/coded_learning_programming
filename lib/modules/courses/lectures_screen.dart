import 'package:flutter/material.dart';
import 'package:learn_programming/core/extensions/build_context_x.dart';

/// Widget for the root/initial pages in the bottom navigation bar.
class LecturesScreen extends StatelessWidget {
  /// Creates a LecturesScreen
  const LecturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lectures'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Screen Lectures', style: context.textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
          ],
        ),
      ),
    );
  }
}
