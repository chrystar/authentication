import 'package:flutter/material.dart';

class TopRightCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.1,
      size.width,
      size.height * 0.3,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.5, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}