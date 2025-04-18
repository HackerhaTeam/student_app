import 'package:flutter/material.dart';

double _getResponsiveWidth(BuildContext context, double size) {
  final double width = MediaQuery.of(context).size.width;
  return (width / 412) * size;
}

double _getResponsiveHeight(BuildContext context, double size) {
  final double height = MediaQuery.of(context).size.height;
  return (height / 892) * size;
}

double _getResponsiveRadius(BuildContext context, double size) {
  return _getResponsiveWidth(context, size);
}

double _getResponsiveFontSize(BuildContext context, double size) {
  final double width = MediaQuery.of(context).size.width;
  final double scaleFactor = width / 412;
  return size * scaleFactor.clamp(0.8, 1.5);
}

extension DoubleResponsiveExtensions on double {
  double w(BuildContext context) => _getResponsiveWidth(context, this);

  double h(BuildContext context) => _getResponsiveHeight(context, this);

  double r(BuildContext context) => _getResponsiveRadius(context, this);

  double fs(BuildContext context) => _getResponsiveFontSize(context, this);
}

extension IntResponsiveExtensions on int {
  double w(BuildContext context) => _getResponsiveWidth(context, toDouble());

  double h(BuildContext context) => _getResponsiveHeight(context, toDouble());

  double r(BuildContext context) => _getResponsiveRadius(context, toDouble());

  double fs(BuildContext context) =>
      _getResponsiveFontSize(context, toDouble());
}
