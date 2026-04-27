import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Responsive design helpers using flutter_screenutil.
/// Call `Responsive.init(context)` in your app root or use `ScreenUtilInit`.
class Responsive {
  Responsive._();

  static const Size designSize = Size(390, 844); // Standard iPhone 14 size

  static void init(BuildContext context) {
    ScreenUtil.init(context, designSize: designSize, minTextAdapt: true, splitScreenMode: true);
  }

  // Extension-like getters for manual scaling if needed
  static double w(num width) => ScreenUtil().setWidth(width);
  static double h(num height) => ScreenUtil().setHeight(height);
  static double sp(num fontSize) => ScreenUtil().setSp(fontSize);
  static double r(num radius) => ScreenUtil().radius(radius);
}

/// A widget that limits the max width of its child for web/desktop.
class ResponsiveConstraint extends StatelessWidget {
  const ResponsiveConstraint({super.key, required this.child, this.maxWidth = 600});

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
