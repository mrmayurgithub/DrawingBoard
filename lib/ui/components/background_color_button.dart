import 'package:drawing_app/providers/bg_color_provider.dart';
import 'package:drawing_app/ui/constants/constants.dart';
import 'package:drawing_app/ui/styles/icon_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BackGroundColorButton extends StatelessWidget {
  const BackGroundColorButton({
    Key key,
    @required BgColorProvider bgColorProvider,
  })  : _bgColorProvider = bgColorProvider,
        super(key: key);

  final BgColorProvider _bgColorProvider;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(8),
      tooltip: 'Vector Fill',
      icon: Consumer<BgColorProvider>(
        builder: (context, bgVal, child) => Icon(
          FontAwesomeIcons.fill,
          color: bgVal.bgColor,
          size: iconSize,
        ),
      ),
      onPressed: () {
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
                  _bgColorProvider.bgColor = value;
                  Navigator.of(context).pop();
                },
              ),
            );
          },
        );
      },
    );
  }
}
