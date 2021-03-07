import 'package:drawing_app/providers/eraser_provider.dart';
import 'package:drawing_app/ui/constants/constants.dart';
import 'package:drawing_app/ui/styles/icon_styles.dart';
import 'package:drawing_app/ui/styles/popup_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PenProperties extends StatelessWidget {
  const PenProperties({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void eraserToPen() {
      var _eraserProv = Provider.of<EraserProvider>(context, listen: false);
      if (_eraserProv.isEraser) {
        _eraserProv.isEraser = false;
      }
    }

    return PopupMenuButton<String>(
      color: popupMenuColor,
      icon: Icon(
        FontAwesomeIcons.pen,
        color: brushColor,
        size: iconSize,
      ),
      onSelected: (String value) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'pentype',
          child: ListTile(
            onTap: () {
              eraserToPen();
              Navigator.of(context).pop();
            },
            tileColor: popupMenuColor,
            title: Text(
              'Pen',
              style: popupTextStyle,
            ),
            trailing: PopupMenuButton<String>(
              color: popupMenuColor,
              tooltip: 'penstroke',
              icon: Icon(
                Icons.more_vert,
                color: popupTextStyle.color,
              ),
              onSelected: (String value) {},
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'roundstroke',
                  child: ListTile(
                    tileColor: popupMenuColor,
                    title: Text(
                      'Round',
                      style: popupTextStyle,
                    ),
                    onTap: () {
                      eraserToPen();

                      strokeCap = StrokeCap.round;
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem<String>(
                  value: 'buttstroke',
                  child: ListTile(
                    tileColor: popupMenuColor,
                    title: Text(
                      'Butt',
                      style: popupTextStyle,
                    ),
                    onTap: () {
                      eraserToPen();
                      strokeCap = StrokeCap.butt;
                      brushWidth = 15;
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem<String>(
                  value: 'squarestroke',
                  child: ListTile(
                    tileColor: popupMenuColor,
                    title: Text(
                      'Sqaure',
                      style: popupTextStyle,
                    ),
                    onTap: () {
                      eraserToPen();
                      strokeCap = StrokeCap.square;
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem<String>(
          value: 'color',
          child: ListTile(
            tileColor: popupMenuColor,
            leading: Icon(
              FontAwesomeIcons.circle,
              color: brushColor,
            ),
            title: Text(
              'Colors',
              style: popupTextStyle,
            ),
            onTap: () {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: MaterialColorPicker(
                      shrinkWrap: true,
                      elevation: 0.0,
                      allowShades: false,
                      selectedColor: brushColor,
                      onMainColorChange: (value) {
                        eraserToPen();
                        brushColor = value;
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem<String>(
          value: 'strokeWidth',
          child: StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
            return Row(
              children: [
                Slider(
                  value: brushWidth,
                  min: 4,
                  max: 40,
                  label: '$brushWidth',
                  onChanged: (value) {},
                  onChangeEnd: (value) {
                    setState(() {
                      eraserToPen();
                      brushWidth = value;
                    });
                  },
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
