import 'package:flutter/material.dart';

class DraggableTextModel {
  Offset offset;
  String text;
}

class MovableText extends StatefulWidget {
  final String text;
  final Offset offset;

  const MovableText({this.text, this.offset});
  @override
  _MovableTextState createState() => _MovableTextState();
}

class _MovableTextState extends State<MovableText> {
  TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: TextField(
        controller: textEditingController,
      ),
      child: TextField(
        controller: textEditingController,
      ),
      onDraggableCanceled: (velocity, offset) {},
    );
  }
}
