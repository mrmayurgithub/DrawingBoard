import 'package:drawing_app/pointColor_model/pointColor_model.dart';
import 'package:flutter/material.dart';

List<PenStroke> points = [];
List<PenStroke> revPoints = [];
List<PenStroke> deletedPoints = [];
// bool isGridPaper = true;
// Color bgColor = Colors.white;

double brushWidth = 10.0;
Color brushColor = Colors.blue;
int count = 0;
StrokeCap strokeCap = StrokeCap.round;
