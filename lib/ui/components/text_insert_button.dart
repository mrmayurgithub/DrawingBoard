import 'package:drawing_app/ui/styles/icon_styles.dart';
import 'package:flutter/material.dart';

class TextInsertButton extends StatelessWidget {
  const TextInsertButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
      icon: Icon(
        Icons.text_rotate_up,
        color: iconColor,
        size: iconSize + 7,
      ),
    );
  }
}
