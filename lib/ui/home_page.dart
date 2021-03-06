import 'package:drawing_app/models/pen_stroke_model.dart';
import 'package:drawing_app/providers/bg_color_provider.dart';
import 'package:drawing_app/providers/eraser_provider.dart';
import 'package:drawing_app/providers/sheetnumber_provider.dart';
import 'package:drawing_app/providers/sheets_provider.dart';
import 'package:drawing_app/ui/constants/constants.dart';
import 'package:drawing_app/ui/painters/draw.dart';
import 'package:drawing_app/ui/components/left_appbar.dart';
import 'package:drawing_app/ui/components/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
                          child: Consumer<SheetNumberProvider>(
                            builder: (context, sheetNProv, child) {
                              return Consumer<EraserProvider>(
                                builder: (context, eraseProv, child) {
                                  print('ERASER CHANGED');
                                  return Consumer<BgColorProvider>(
                                    builder: (BuildContext context, bg, Widget child) => Container(
                                      color: bg.bgColor,
                                      child: MouseRegion(
                                        cursor: eraseProv.isEraser ? SystemMouseCursors.copy : SystemMouseCursors.basic,
                                        child: GestureDetector(
                                          onPanUpdate: (DragUpdateDetails details) {
                                            setState(
                                              () {
                                                RenderBox object = context.findRenderObject();
                                                Offset _localPosition = object.globalToLocal(details.globalPosition);
                                                PenStroke _localPoint = PenStroke();
                                                _localPoint.color = eraseProv.isEraser ? bg.bgColor : brushColor;
                                                _localPoint.offset = _localPosition;
                                                _localPoint.brushWidth = eraseProv.isEraser ? eraserWidth : brushWidth;
                                                _localPoint.strokeCap = strokeCap;
                                                points = List.from(points)..add(_localPoint);
                                              },
                                            );
                                          },
                                          onPanEnd: (DragEndDetails details) => {
                                            deletedPoints.clear(),
                                            points.add(null),
                                            print('POINTS: ${points.length}'),
                                          },
                                          child: CustomPaint(
                                            painter: DrawPen(points: points),
                                            size: Size.infinite,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        )
                      : Consumer<SheetNumberProvider>(
                          builder: (context, sheetNProv, child) {
                            print('NUMBER OF SHEETS 2: ${sheetNProv.sheetNumber}');

                            return Consumer<EraserProvider>(
                              builder: (context, eraseProv, child) => Consumer<BgColorProvider>(
                                builder: (context, bg, child) => Container(
                                  color: bg.bgColor,
                                  child: MouseRegion(
                                    cursor: eraseProv.isEraser ? SystemMouseCursors.disappearing : SystemMouseCursors.basic,
                                    child: GestureDetector(
                                      onPanUpdate: (DragUpdateDetails details) {
                                        setState(
                                          () {
                                            RenderBox object = context.findRenderObject();
                                            Offset _localPosition = object.globalToLocal(details.globalPosition);
                                            PenStroke _localPoint = PenStroke();
                                            _localPoint.color = eraseProv.isEraser ? bg.bgColor : brushColor;
                                            _localPoint.offset = _localPosition;
                                            _localPoint.brushWidth = eraseProv.isEraser ? eraserWidth : brushWidth;
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
                              ),
                            );
                          },
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
    );
  }
}
