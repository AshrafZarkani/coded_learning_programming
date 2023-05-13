import 'package:flutter/material.dart';
import 'package:learn_programming/core/constants/constants.dart';
import 'package:sizer/sizer.dart';

class CustomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyAppColors.blue,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(10.h);
}
