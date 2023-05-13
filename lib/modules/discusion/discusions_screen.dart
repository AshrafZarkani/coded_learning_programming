
import 'package:flutter/material.dart';
import 'package:learn_programming/core/extensions/build_context_x.dart';

/// Widget for the root/initial pages in the bottom navigation bar.
class DiscusionsScreen extends StatelessWidget {
  /// Creates a LecturesScreen
  const DiscusionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discusions Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Screen Discusion', style: context.textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
          ],
        ),
      ),
    );
  }
}