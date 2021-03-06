import 'package:drawing_app/ui/styles/icon_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShapeInsertButton extends StatelessWidget {
  const ShapeInsertButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return PopupMenuButton<String>(
    //   tooltip: 'Insert Shape',
    //   icon: Icon(
    //     FontAwesomeIcons.shapes,
    //     color: Colors.white,
    //     size: 18,
    //   ),
    //   onSelected: (String value) {},
    //   itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
    //     PopupMenuItem<String>(
    //       value: 'shape',
    //       child: ListTile(
    //         leading: Icon(FontAwesomeIcons.circle),
    //         title: Text('Shape'),
    //         onTap: () {
    //           return showDialog(
    //             context: context,
    //             builder: (context) {
    //               return Dialog(
    //                 child: Container(
    //                   width: MediaQuery.of(context).size.width / 4,
    //                   height: MediaQuery.of(context).size.height / 3,
    //                   child: SingleChildScrollView(
    //                     child: ListView(
    //                       shrinkWrap: true,
    //                       children: [
    //                         ListTile(
    //                           dense: true,
    //                           leading: Icon(FontAwesomeIcons.square),
    //                           title: Text('Square'),
    //                         ),
    //                         ListTile(
    //                           dense: true,
    //                           leading: Icon(FontAwesomeIcons.circle),
    //                           title: Text('Circle'),
    //                         ),
    //                         ListTile(
    //                           dense: true,
    //                           leading: Icon(FontAwesomeIcons.star),
    //                           title: Text('Star'),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               );
    //             },
    //           );
    //         },
    //       ),
    //     ),
    //     PopupMenuDivider(),
    //     PopupMenuItem<String>(
    //       value: 'shapeColor',
    //       child: ListTile(
    //         leading: Icon(
    //           FontAwesomeIcons.circle,
    //           color: Colors.blue,
    //         ),
    //         title: Text('Shape Color'),
    //         onTap: () {},
    //       ),
    //     ),
    //   ],
    // );
    return IconButton(
      tooltip: 'Insert Text',
      padding: EdgeInsets.all(8.0),
      icon: Icon(
        FontAwesomeIcons.shapes,
        color: Colors.black,
        size: iconSize,
      ),
      onPressed: () {
        return showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('This feature will be available soon'),
              ),
            ),
          ),
        );
      },
    );
  }
}
