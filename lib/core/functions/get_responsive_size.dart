import 'package:flutter/material.dart';

double getResponsiveSize(BuildContext context,double size)
{
double width=MediaQuery.of(context).size.width;
double scaleFactor=width/412;
double responsiveSize=scaleFactor*width;
return responsiveSize;
}