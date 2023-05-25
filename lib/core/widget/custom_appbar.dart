import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    this.iconThemeData,
    this.actions,
    this.backgroundColor = Colors.white,
    this.elevation = 2.0,
    this.flexibleSpace,
    this.leading,
    this.leadingWidth,
    super.key,
  });

  final List<Widget>? actions;
  final Color? backgroundColor;
  final double? elevation;
  final Widget? flexibleSpace;
  final IconThemeData? iconThemeData;
  final Widget? leading;
  final double? leadingWidth;
  final Widget title;

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      leadingWidth: leadingWidth,
      iconTheme: iconThemeData,
      title: title,
      backgroundColor: backgroundColor,
      elevation: elevation,
      actions: actions,
      flexibleSpace: flexibleSpace,
    );
  }
}
