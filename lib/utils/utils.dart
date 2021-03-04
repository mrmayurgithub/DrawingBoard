import 'package:flutter/widgets.dart';

void initializeUtils(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  screenHeight = size.height;
  screenWidth = size.width;
}

double screenHeight;
double screenWidth;
