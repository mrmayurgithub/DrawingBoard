import 'package:flutter/material.dart';

class TextInsertButton extends StatelessWidget {
  const TextInsertButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
      child: Text(
        'T',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
