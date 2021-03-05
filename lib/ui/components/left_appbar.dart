import 'package:drawing_app/providers/bg_color_provider.dart';
import 'package:drawing_app/providers/sheets_provider.dart';
import 'package:drawing_app/ui/components/background_color_button.dart';
import 'package:drawing_app/ui/components/pen_properties_button.dart';
import 'package:drawing_app/ui/components/shape_insert_button.dart';
import 'package:drawing_app/ui/components/text_insert_button.dart';
import 'package:drawing_app/ui/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopAppBar extends StatefulWidget {
  @override
  _TopAppBarState createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  void createNewFunction(bool isgrid) {
    Navigator.of(context).pop();
    var _sheetView = Provider.of<SheetsViewProvider>(context, listen: false);
    _sheetView.isGrid = isgrid;
    Scaffold.of(context).setState(() {
      points.clear();
      deletedPoints.clear();
      revPoints.clear();
    });
  }

  double www = 10;
  @override
  Widget build(BuildContext context) {
    var _bgColorProvider = Provider.of<BgColorProvider>(context);
    return Builder(
      builder: (BuildContext context) => Container(
        color: Colors.black,
        width: 50,
        height: double.infinity,
        child: Column(
          children: [
            PenProperties(),
            BackGroundColorButton(bgColorProvider: _bgColorProvider),
            ShapeInsertButton(),
            TextInsertButton(),
            PopupMenuButton<String>(
              tooltip: 'Sheet View',
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onSelected: (String value) {},
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'normalpaper',
                  child: ListTile(
                    title: Text('Normal'),
                    onTap: () {
                      createNewFunction(false);
                    },
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem<String>(
                  value: 'gridpaper',
                  child: ListTile(
                    title: Text('Grid Paper'),
                    onTap: () {
                      createNewFunction(true);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class TextInsertButton extends StatelessWidget {
//   const TextInsertButton({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {
//         return showDialog(
//           context: context,
//           builder: (context) => Dialog(
//             child: Container(
//               child: Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text('This feature will be available soon'),
//               ),
//             ),
//           ),
//         );
//       },
//       child: Text(
//         'T',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 20,
//         ),
//       ),
//     );
//   }
// }

// class ShapeInsertButton extends StatelessWidget {
//   const ShapeInsertButton({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<String>(
//       tooltip: 'Insert Shape',
//       icon: Icon(
//         FontAwesomeIcons.shapes,
//         color: Colors.white,
//         size: 18,
//       ),
//       onSelected: (String value) {},
//       itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//         PopupMenuItem<String>(
//           value: 'shape',
//           child: ListTile(
//             leading: Icon(FontAwesomeIcons.circle),
//             title: Text('Shape'),
//             onTap: () {
//               return showDialog(
//                 context: context,
//                 builder: (context) {
//                   return Dialog(
//                     child: Container(
//                       width: MediaQuery.of(context).size.width / 4,
//                       height: MediaQuery.of(context).size.height / 3,
//                       child: SingleChildScrollView(
//                         child: ListView(
//                           shrinkWrap: true,
//                           children: [
//                             ListTile(
//                               dense: true,
//                               leading: Icon(FontAwesomeIcons.square),
//                               title: Text('Square'),
//                             ),
//                             ListTile(
//                               dense: true,
//                               leading: Icon(FontAwesomeIcons.circle),
//                               title: Text('Circle'),
//                             ),
//                             ListTile(
//                               dense: true,
//                               leading: Icon(FontAwesomeIcons.star),
//                               title: Text('Star'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//         PopupMenuDivider(),
//         PopupMenuItem<String>(
//           value: 'shapeColor',
//           child: ListTile(
//             leading: Icon(
//               FontAwesomeIcons.circle,
//               color: Colors.blue,
//             ),
//             title: Text('Shape Color'),
//             onTap: () {},
//           ),
//         ),
//       ],
//     );
//   }
// }

// class BackGroundColorButton extends StatelessWidget {
//   const BackGroundColorButton({
//     Key key,
//     @required BgColorProvider bgColorProvider,
//   })  : _bgColorProvider = bgColorProvider,
//         super(key: key);

//   final BgColorProvider _bgColorProvider;

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       padding: EdgeInsets.all(8),
//       tooltip: 'Vector Fill',
//       icon: Icon(
//         FontAwesomeIcons.fill,
//         color: Colors.white,
//         size: 15,
//       ),
//       onPressed: () {
//         return showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               content: MaterialColorPicker(
//                 shrinkWrap: true,
//                 elevation: 0.0,
//                 allowShades: false,
//                 selectedColor: brushColor,
//                 onMainColorChange: (value) {
//                   _bgColorProvider.bgColor = value;
//                   Navigator.of(context).pop();
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class PenProperties extends StatelessWidget {
//   const PenProperties({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<String>(
//       icon: Icon(
//         FontAwesomeIcons.pen,
//         size: 14,
//         color: brushColor == Colors.black ? Colors.white : brushColor,
//       ),
//       onSelected: (String value) {},
//       itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//         PopupMenuItem<String>(
//           value: 'pentype',
//           child: ListTile(
//             title: Text('Pen'),
//             trailing: PopupMenuButton<String>(
//               tooltip: 'penstroke',
//               icon: Icon(
//                 Icons.more_vert,
//                 color: Colors.black,
//               ),
//               onSelected: (String value) {},
//               itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//                 PopupMenuItem<String>(
//                   value: 'roundstroke',
//                   child: ListTile(
//                     title: Text('Round'),
//                     onTap: () {
//                       strokeCap = StrokeCap.round;
//                       Navigator.of(context).pop();
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ),
//                 PopupMenuDivider(),
//                 PopupMenuItem<String>(
//                   value: 'buttstroke',
//                   child: ListTile(
//                     title: Text('Butt'),
//                     onTap: () {
//                       strokeCap = StrokeCap.butt;
//                       brushWidth = 15;
//                       Navigator.of(context).pop();
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ),
//                 PopupMenuDivider(),
//                 PopupMenuItem<String>(
//                   value: 'squarestroke',
//                   child: ListTile(
//                     title: Text('Square'),
//                     onTap: () {
//                       strokeCap = StrokeCap.square;
//                       Navigator.of(context).pop();
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         PopupMenuDivider(),
//         PopupMenuItem<String>(
//           value: 'color',
//           child: ListTile(
//             leading: Icon(
//               FontAwesomeIcons.circle,
//               color: Colors.blue,
//             ),
//             title: Text('Colors'),
//             onTap: () {
//               return showDialog(
//                 context: context,
//                 builder: (context) {
//                   return AlertDialog(
//                     content: MaterialColorPicker(
//                       shrinkWrap: true,
//                       elevation: 0.0,
//                       allowShades: false,
//                       selectedColor: brushColor,
//                       onMainColorChange: (value) {
//                         brushColor = value;
//                         Navigator.of(context).pop();
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//         PopupMenuDivider(),
//         PopupMenuItem<String>(
//           value: 'strokeWidth',
//           child: StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
//             return Row(
//               children: [
//                 Slider(
//                   value: brushWidth,
//                   min: 4,
//                   max: 40,
//                   label: '$brushWidth',
//                   onChanged: (value) {
//                     setState(() {
//                       brushWidth = value;
//                     });
//                   },
//                 ),
//               ],
//             );
//           }),
//         ),
//       ],
//     );
//   }
// }
