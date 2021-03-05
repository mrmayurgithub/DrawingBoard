import 'package:drawing_app/ui/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PenProperties extends StatelessWidget {
  const PenProperties({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        FontAwesomeIcons.pen,
        size: 14,
        color: brushColor == Colors.black ? Colors.white : brushColor,
      ),
      onSelected: (String value) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'pentype',
          child: ListTile(
            title: Text('Pen'),
            trailing: PopupMenuButton<String>(
              tooltip: 'penstroke',
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onSelected: (String value) {},
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'roundstroke',
                  child: ListTile(
                    title: Text('Round'),
                    onTap: () {
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
                    title: Text('Butt'),
                    onTap: () {
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
                    title: Text('Square'),
                    onTap: () {
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
            leading: Icon(
              FontAwesomeIcons.circle,
              color: Colors.blue,
            ),
            title: Text('Colors'),
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
                  onChanged: (value) {
                    setState(() {
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
