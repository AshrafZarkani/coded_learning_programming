
import 'package:flutter/material.dart';
import 'package:learn_programming/core/extensions/build_context_x.dart';

class ProfileScreen extends StatelessWidget {
  /// Creates a ProfileScreen
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Screen Profile', style: context.textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
          ],
        ),
      ),
    );
  }
}