import 'package:drawing_app/providers/bg_color_provider.dart';
import 'package:drawing_app/providers/sheets_provider.dart';
import 'package:drawing_app/ui/components/background_color_button.dart';
import 'package:drawing_app/ui/components/pen_properties_button.dart';
import 'package:drawing_app/ui/components/shape_insert_button.dart';
import 'package:drawing_app/ui/components/text_insert_button.dart';
import 'package:drawing_app/ui/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

            // ShapeInsertButton(),
            IconButton(
              tooltip: 'Erase',
              padding: EdgeInsets.all(8),
              icon: Icon(
                FontAwesomeIcons.eraser,
                color: Colors.white,
                size: 15,
              ),
              onPressed: () {},
            ),
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
