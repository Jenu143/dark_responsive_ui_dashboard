import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.desktop,
    this.tablet,
  }) : super(key: key);

  // is for   //! mobile
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  // is for   //! tablet
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  // is for   //! desktop
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    // height 1100 thi moti hoy to tablet
    if (_size.width >= 1100) {
      return desktop;
    }

    // Height 1100 thi nani ane 850 k tenathi moti hoy to tablet
    else if (_size.width >= 850 && tablet != null) {
      return tablet!;
    }

    //
    else {
      return mobile;
    }
  }
}
