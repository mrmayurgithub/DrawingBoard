import 'package:drawing_app/ui/constants/constants.dart';
import 'package:drawing_app/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopAppBar extends StatefulWidget {
  @override
  _TopAppBarState createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  void createNewFunction(bool isgrid) {
    Navigator.of(context).pop();
    Scaffold.of(context).setState(() {
      bgColor = Colors.white;
      isGridPaper = isgrid;
      points.clear();
      deletedPoints.clear();
      revPoints.clear();
    });
  }

  double www = 10;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => Container(
        color: Colors.black,
        width: 50,
        height: double.infinity,
        child: Column(
          children: [
            PopupMenuButton<String>(
              icon: Icon(
                FontAwesomeIcons.pen,
                size: 14,
                color: brushColor == Colors.black ? Colors.white : brushColor,
              ),
              onSelected: (String value) {},
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'color',
                  child: ListTile(
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
                PopupMenuItem<String>(
                  value: 'strokeWidth',
                  child: StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) setState) => Slider(
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
                  ),
                ),
              ],
            ),

            IconButton(
              icon: Icon(
                FontAwesomeIcons.fill,
                color: Colors.white,
                size: 15,
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
                          bgColor = value;
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  },
                );
              },
            ),
            // PopupMenuItem<String>(
            //   value: 'opacity',
            //   child: ListTile(
            //     title: TextFormField(
            //       inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            //       onChanged: (value) {
            //         colorOpacity = double.parse(value);
            //       },
            //       decoration: InputDecoration.collapsed(
            //         hintText: colorOpacity.toString(),
            //       ),
            //     ),
            //   ),
            // ),
            // PopupMenuButton<String>(
            //   icon: Icon(
            //     FontAwesomeIcons.font,
            //     size: 14,
            //     color: Colors.white,
            //   ),
            //   onSelected: (String value) {},
            //   itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            //     PopupMenuItem<String>(
            //       value: 'fonts',
            //       child: ListTile(
            //         title: Text('Font'),
            //         onTap: () {},
            //       ),
            //     ),
            //   ],
            // ),
            TextButton(
              onPressed: () {},
              child: Text(
                'T',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),

            PopupMenuButton<String>(
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
