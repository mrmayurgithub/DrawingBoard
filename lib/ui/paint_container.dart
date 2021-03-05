// import 'package:drawing_app/pointColor_model/pointColor_model.dart';
// import 'package:drawing_app/ui/constants/constants.dart';
// import 'package:drawing_app/ui/draw.dart';
// import 'package:flutter/material.dart';

// class PaintContainer extends StatelessWidget {
//   const PaintContainer({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // List<StrokeCap> caps = [StrokeCap.round, StrokeCap.butt, StrokeCap.square];

//     return Center(
//       child: isGridPaper
//           ? GridPaper(
//               interval: 10,
//               divisions: 2,
//               subdivisions: 5,
//               child: Container(
//                 color: bgColor,
//                 child: GestureDetector(
//                   onPanUpdate: (DragUpdateDetails details) {
//                     setState(
//                       () {
//                         RenderBox object = context.findRenderObject();
//                         Offset _localPosition = object.globalToLocal(details.globalPosition);
//                         PenStroke _localPoint = PenStroke();
//                         _localPoint.color = brushColor;
//                         _localPoint.offset = _localPosition;
//                         _localPoint.brushWidth = brushWidth;
//                         _localPoint.strokeCap = strokeCap;
//                         points = List.from(points)..add(_localPoint);
//                       },
//                     );
//                   },
//                   onPanEnd: (DragEndDetails details) => {
//                     deletedPoints.clear(),
//                     points.add(null),
//                   },
//                   child: CustomPaint(
//                     painter: DrawPen(points: points),
//                     size: Size.infinite,
//                   ),
//                 ),
//               ),
//             )
//           : Container(
//               color: bgColor,
//               child: GestureDetector(
//                 onPanUpdate: (DragUpdateDetails details) {
//                   setState(
//                     () {
//                       RenderBox object = context.findRenderObject();
//                       Offset _localPosition = object.globalToLocal(details.globalPosition);
//                       PenStroke _localPoint = PenStroke();
//                       _localPoint.color = brushColor;
//                       _localPoint.offset = _localPosition;
//                       _localPoint.brushWidth = brushWidth;
//                       _localPoint.strokeCap = strokeCap;

//                       points = List.from(points)..add(_localPoint);
//                     },
//                   );
//                 },
//                 onPanEnd: (DragEndDetails details) => {
//                   deletedPoints.clear(),
//                   points.add(null),
//                 },
//                 child: CustomPaint(
//                   painter: DrawPen(points: points),
//                   size: Size.infinite,
//                 ),
//               ),
//             ),
//     );
//   }
// }
