import 'package:drawing_app/providers/sheetnumber_provider.dart';
import 'package:drawing_app/ui/constants/constants.dart';
import 'package:drawing_app/ui/styles/icon_styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class RightBar extends StatefulWidget {
  @override
  _RightBarState createState() => _RightBarState();
}

class _RightBarState extends State<RightBar> {
  int z = 0;

  void undo() async {
    try {
      int c = 0;
      Scaffold.of(context).setState(() {
        for (int k = 0; k < points.length; k++) {
          if (points[k] == null) {
            c++;
            if (c == 2) break;
          }
        }
        if (c == 1)
          points.clear();
        else {
          revPoints = points.reversed.toList();
          int i, count = 0;
          for (i = 0; i < revPoints.length; i++) {
            if (revPoints[i] == null) {
              count++;
              if (count == 2) break;
            }
          }
          for (int k = points.length - i - 1; k < points.length; k++) {
            deletedPoints.add(points[k]);
          }

          points.removeRange(points.length - i - 1, points.length - 1);
        }
      });
    } catch (e) {
      await Fluttertoast.showToast(msg: e.toString());
    }
  }

  void redo() async {
    try {
      Scaffold.of(context).setState(
        () {
          int c = 0;
          for (int k = 0; k < points.length; k++) {
            if (points[k] == null) {
              c++;
              if (c == 2) break;
            }
          }
          if (c == 1)
            for (int i = 0; i < deletedPoints.length; i++) {
              points.add(deletedPoints[i]);
            }
          else {
            int count = 0, i;
            revPoints = deletedPoints.reversed.toList();
            for (i = 0; i < revPoints.length; i++) {
              if (revPoints[i] == null) {
                count++;
              }
              if (count == 2) break;
            }
            for (int j = deletedPoints.length - i - 1;
                j < deletedPoints.length;
                j++) {
              points.add(deletedPoints[j]);
            }

            deletedPoints.removeRange(
                deletedPoints.length - i - 1, deletedPoints.length - 1);
          }
          revPoints.clear();
        },
      );
      print(points.toList());
    } catch (e) {
      if (z <= 1)
        await Fluttertoast.showToast(msg: e.toString());
      else
        Scaffold.of(context).setState(() {});
      z++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        width: 50,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<SheetNumberProvider>(
                builder: (context, nsheetProv, child) => TextButton(
                  onPressed: () {},
                  child: Text('${nsheetProv.sheetNumber + 1}'),
                ),
              ),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.undo,
                  color: iconColor,
                  size: iconSize,
                ),
                onPressed: () => undo(),
              ),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.redo,
                  color: iconColor,
                  size: iconSize,
                ),
                onPressed: () => redo(),
              ),
              IconButton(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: iconColor,
                  size: iconSize,
                ),
                onPressed: () {
                  Scaffold.of(context).setState(() {
                    points.clear();
                    revPoints.clear();
                    deletedPoints.clear();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
