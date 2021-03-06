// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// // ignore: must_be_immutable
// class FancyCursor extends StatefulWidget {
//   FancyCursor({
//     @required this.child,
//     this.trail = true,
//     this.color,
//     this.size,
//     this.delay,
//     this.curve,
//     this.customCursor,
//     this.trailColor,
//     this.trailSize,
//     this.trailDelay,
//     this.trailCurve,
//     this.trailOpacity,
//     this.trailCustomCursor,
//     this.nativeCursor,
//     Key key,
//   }) : super(key: key) {
//     delay ??= const Duration();
//     curve ??= Curves.elasticOut;

//     trailDelay ??= delay + const Duration(milliseconds: 300);
//     trailCurve ??= curve;

//     if (customCursor != null) {
//       assert(color == null, 'color != null condition was not true, Color was given null.');
//       assert(size == null, 'size != null condition was not true, Size was given null. Specify a double value to size.');
//       trailCustomCursor ??= Opacity(
//         opacity: trailOpacity ?? 0.3,
//         child: Transform.scale(
//           scale: trailSize ?? 1.2,
//           child: customCursor,
//         ),
//       );
//     } else {
//       color ??= Colors.black;
//       size ??= 8;

//       if (trailCustomCursor != null) {
//         assert(trailColor == null, 'trailColor != null condition was not true, Color was given null.');
//         assert(trailSize == null, 'trailSize != null condition was not true, Size was given null. Specify a double value to size.');
//       } else {
//         trailColor ??= color.withOpacity(0.3);
//         trailSize ??= size * 1.5;
//       }
//     }
//   }

//   final Widget child;

//   Color color;

//   Color trailColor;

//   double size;

//   double trailSize;

//   Duration delay;

//   Duration trailDelay;

//   Curve curve;

//   Curve trailCurve;

//   Widget customCursor;

//   Widget trailCustomCursor;

//   bool trail;

//   double trailOpacity;

//   MouseCursor nativeCursor;

//   @override
//   _FancyCursorState createState() => _FancyCursorState();
// }

// class _FancyCursorState extends State<FancyCursor> {
//   Offset position = Offset.zero;

//   @override
//   Widget build(BuildContext context) => Material(
//         child: MouseRegion(
//           cursor: widget.nativeCursor ?? SystemMouseCursors.none,
//           onHover: (phe) {
//             setState(() => position = phe.position);
//           },
//           child: Stack(
//             children: [
//               widget.child,
//               if (widget.trail)
//                 AnimatedPositioned(
//                   duration: widget.trailDelay,
//                   curve: widget.trailCurve,
//                   top: position.dy - ((widget.trailSize ?? 0) / 2),
//                   left: position.dx - ((widget.trailSize ?? 0) / 2),
//                   child: IgnorePointer(
//                     child: widget.trailCustomCursor ??
//                         Container(
//                           decoration: BoxDecoration(
//                             color: widget.trailColor,
//                             borderRadius: BorderRadius.circular(widget.trailSize / 2),
//                           ),
//                           height: widget.trailSize,
//                           width: widget.trailSize,
//                         ),
//                   ),
//                 ),
//               AnimatedPositioned(
//                 duration: widget.delay,
//                 curve: widget.curve,
//                 top: position.dy - (widget.size ?? 0) / 2,
//                 left: position.dx - (widget.size ?? 0) / 2,
//                 child: IgnorePointer(
//                   child: widget.customCursor ??
//                       Container(
//                         decoration: BoxDecoration(
//                           color: widget.color,
//                           borderRadius: BorderRadius.circular(widget.size / 2),
//                         ),
//                         height: widget.size,
//                         width: widget.size,
//                       ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
// }
