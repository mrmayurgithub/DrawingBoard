import 'package:drawing_app/models/pen_stroke_model.dart';
import 'package:drawing_app/providers/bg_color_provider.dart';
import 'package:drawing_app/providers/sheets_provider.dart';
import 'package:drawing_app/ui/constants/constants.dart';
import 'package:drawing_app/ui/painters/draw.dart';
import 'package:drawing_app/ui/components/left_appbar.dart';
import 'package:drawing_app/ui/components/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawScreen extends StatefulWidget {
  @override
  _DrawScreenState createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) => SafeArea(
          child: Stack(
            children: [
              Consumer<SheetsViewProvider>(
                builder: (context, sheetView, child) {
                  return sheetView.isGrid
                      ? GridPaper(
                          interval: 10,
                          divisions: 2,
                          subdivisions: 5,
                          child: Consumer<BgColorProvider>(
                            builder: (BuildContext context, bg, Widget child) => Container(
                              color: bg.bgColor,
                              child: GestureDetector(
                                onPanUpdate: (DragUpdateDetails details) {
                                  setState(
                                    () {
                                      RenderBox object = context.findRenderObject();
                                      Offset _localPosition = object.globalToLocal(details.globalPosition);
                                      PenStroke _localPoint = PenStroke();
                                      _localPoint.color = brushColor;
                                      _localPoint.offset = _localPosition;
                                      _localPoint.brushWidth = brushWidth;
                                      _localPoint.strokeCap = strokeCap;
                                      points = List.from(points)..add(_localPoint);
                                    },
                                  );
                                },
                                onPanEnd: (DragEndDetails details) => {
                                  deletedPoints.clear(),
                                  points.add(null),
                                },
                                child: CustomPaint(
                                  painter: DrawPen(points: points),
                                  size: Size.infinite,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Consumer<BgColorProvider>(
                          builder: (context, bg, child) => Container(
                            color: bg.bgColor,
                            child: GestureDetector(
                              onPanUpdate: (DragUpdateDetails details) {
                                setState(
                                  () {
                                    RenderBox object = context.findRenderObject();
                                    Offset _localPosition = object.globalToLocal(details.globalPosition);
                                    PenStroke _localPoint = PenStroke();
                                    _localPoint.color = brushColor;
                                    _localPoint.offset = _localPosition;
                                    _localPoint.brushWidth = brushWidth;
                                    _localPoint.strokeCap = strokeCap;

                                    points = List.from(points)..add(_localPoint);
                                  },
                                );
                              },
                              onPanEnd: (DragEndDetails details) => {
                                deletedPoints.clear(),
                                points.add(null),
                              },
                              child: CustomPaint(
                                painter: DrawPen(points: points),
                                size: Size.infinite,
                              ),
                            ),
                          ),
                        );
                },
              ),
              TopAppBar(),
              Positioned(
                right: 0.0,
                child: RightBar(),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: Speeddial(speedDialtext: speedDialtext, height: height),
    );
  }
}
