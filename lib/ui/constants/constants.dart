import 'package:drawing_app/models/pen_stroke_model.dart';
import 'package:drawing_app/models/sheets_model.dart';
import 'package:flutter/material.dart';

List<PenStroke> points = [];
List<PenStroke> revPoints = [];
List<PenStroke> deletedPoints = [];
List<SheetsModel> sheets = [];
double brushWidth = 10.0;
Color brushColor = Colors.blue;
int count = 0;
StrokeCap strokeCap = StrokeCap.round;
String githubUrl = 'https://github.com/mrmayurgithub/DrawingBoard';
double eraserWidth = 30.0;
