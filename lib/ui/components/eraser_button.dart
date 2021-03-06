import 'package:drawing_app/providers/eraser_provider.dart';
import 'package:drawing_app/ui/constants/constants.dart';
import 'package:drawing_app/ui/styles/icon_styles.dart';
import 'package:drawing_app/ui/styles/popup_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EraserButton extends StatelessWidget {
  const EraserButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _eraserProv = Provider.of<EraserProvider>(context, listen: false);

    return PopupMenuButton<String>(
      color: popupMenuColor,
      icon: Icon(
        FontAwesomeIcons.eraser,
        color: iconColor,
        size: iconSize,
      ),
      onSelected: (String value) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'eraser',
          child: ListTile(
            leading: Icon(
              FontAwesomeIcons.eraser,
              color: popupTextStyle.color,
              size: iconSize,
            ),
            onTap: () {
              _eraserProv.isEraser = true;
              eraserWidth = 30.0;
              Navigator.of(context).pop();
            },
            tileColor: popupMenuColor,
            title: Text(
              'Eraser',
              style: popupTextStyle,
            ),
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem<String>(
          value: 'eraserWidth',
          child: StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
            return Row(
              children: [
                Slider(
                  value: eraserWidth,
                  min: 4,
                  max: 40,
                  label: '$eraserWidth',
                  onChanged: (value) {
                    setState(() {
                      eraserWidth = value;
                      _eraserProv.isEraser = true;
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
