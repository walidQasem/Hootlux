import 'package:flutter/cupertino.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desctop;
  const ResponsiveLayout(
      {super.key, required this.mobile, required this.desctop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cont) {
      if (cont.maxWidth < 500) {
        return mobile;
      } else {
        return desctop;
      }
    });
  }
}
