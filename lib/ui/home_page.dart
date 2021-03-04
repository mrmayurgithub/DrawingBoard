import 'package:drawing_app/pointColor_model/pointColor_model.dart';
import 'package:drawing_app/ui/constants/constants.dart';
import 'package:drawing_app/ui/draw.dart';
import 'package:drawing_app/ui/left_appbar.dart';
import 'package:drawing_app/ui/right_bar.dart';
import 'package:flutter/material.dart';

class DrawScreen extends StatefulWidget {
  @override
  _DrawScreenState createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
  @override
  Widget build(BuildContext context) {
    final h = 1001.0694778740428;

    return Scaffold(
      body: Builder(
        builder: (BuildContext context) => SafeArea(
          child: Stack(
            children: [
              isGridPaper
                  ? GridPaper(
                      interval: 10,
                      divisions: 2,
                      subdivisions: 5,
                      child: Container(
                        color: bgColor,
                        child: GestureDetector(
                          onPanUpdate: (DragUpdateDetails details) {
                            setState(
                              () {
                                RenderBox object = context.findRenderObject();
                                Offset _localPosition = object.globalToLocal(details.globalPosition);
                                pointColor _localPoint = pointColor();
                                _localPoint.color = brushColor;
                                _localPoint.offset = _localPosition;
                                _localPoint.brushWidth = brushWidth;
                                points = List.from(points)..add(_localPoint);
                              },
                            );
                          },
                          onPanEnd: (DragEndDetails details) => {
                            deletedPoints.clear(),
                            points.add(null),
                          },
                          child: CustomPaint(
                            painter: Draw(points: points),
                            size: Size.infinite,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      color: bgColor,
                      child: GestureDetector(
                        onPanUpdate: (DragUpdateDetails details) {
                          setState(
                            () {
                              RenderBox object = context.findRenderObject();
                              Offset _localPosition = object.globalToLocal(details.globalPosition);
                              pointColor _localPoint = pointColor();
                              _localPoint.color = brushColor;
                              _localPoint.offset = _localPosition;
                              _localPoint.brushWidth = brushWidth;
                              points = List.from(points)..add(_localPoint);
                            },
                          );
                        },
                        onPanEnd: (DragEndDetails details) => {
                          deletedPoints.clear(),
                          points.add(null),
                        },
                        child: CustomPaint(
                          painter: Draw(points: points),
                          size: Size.infinite,
                        ),
                      ),
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

// class Speeddial extends StatelessWidget {
//   const Speeddial({
//     Key key,
//     @required this.speedDialtext,
//     @required this.height,
//   }) : super(key: key);

//   final double speedDialtext;
//   final double height;

//   @override
//   Widget build(BuildContext context) {
//     return SpeedDial(
//       icon: Icons.edit,
//       overlayColor: Colors.black,
//       overlayOpacity: 0.5,
//       shape: CircleBorder(),
//       children: [
//         SpeedDialChild(
//           backgroundColor: Colors.white,
//           child: Icon(Icons.clear, color: Colors.black),
//           label: 'Clear All',
//           labelStyle: speedialTextSize(speedDialtext, height),
//           onTap: () {
//             // ignore: invalid_use_of_protected_member
//             Scaffold.of(context).setState(() {
//               points.clear();
//             });
//           },
//         ),
//         SpeedDialChild(
//           backgroundColor: Colors.white,
//           child: Icon(FontAwesomeIcons.paintBrush, color: Colors.black, size: 15),
//           label: 'Brush Size 10',
//           labelStyle: speedialTextSize(speedDialtext, height),
//           onTap: () => brushWidth = 10,
//         ),
//         SpeedDialChild(
//           backgroundColor: Colors.white,
//           child: Icon(FontAwesomeIcons.paintBrush, color: Colors.black, size: 20),
//           label: 'Brush Size 25',
//           labelStyle: speedialTextSize(speedDialtext, height),
//           onTap: () => brushWidth = 25,
//         ),
//         SpeedDialChild(
//           backgroundColor: Colors.white,
//           child: Icon(FontAwesomeIcons.paintBrush, color: Colors.red, size: 20),
//           label: 'Red',
//           labelStyle: speedialTextSize(speedDialtext, height),
//           onTap: () => brushColor = Colors.red,
//         ),
//         SpeedDialChild(
//           backgroundColor: Colors.white,
//           child: Icon(FontAwesomeIcons.paintBrush, color: Colors.green, size: 20),
//           label: 'Green',
//           labelStyle: speedialTextSize(speedDialtext, height),
//           onTap: () => brushColor = Colors.green,
//         ),
//         SpeedDialChild(
//           backgroundColor: Colors.white,
//           child: Icon(FontAwesomeIcons.paintBrush, color: Colors.black, size: 20),
//           label: 'Black',
//           labelStyle: speedialTextSize(speedDialtext, height),
//           onTap: () => brushColor = Colors.black,
//         ),
//       ],
//     );
//   }
// }

// speedialTextSize(double speedDialtext, double height) {}
