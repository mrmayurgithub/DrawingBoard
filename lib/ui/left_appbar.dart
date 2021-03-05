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
                  value: 'pentype',
                  child: ListTile(
                    title: Text('Pen'),
                    onTap: () {},
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
            ),
            IconButton(
              tooltip: 'Vector Fill',
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
            PopupMenuButton<String>(
              tooltip: 'Insert Shape',
              icon: Icon(
                FontAwesomeIcons.shapes,
                color: Colors.white,
                size: 18,
              ),
              onSelected: (String value) {},
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'shape',
                  child: ListTile(
                    leading: Icon(FontAwesomeIcons.circle),
                    title: Text('Shape'),
                    onTap: () {
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 3,
                              child: GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                // children: List.generate(10, (index) => null),
                                children: [
                                  Icon(FontAwesomeIcons.circle),
                                  Icon(FontAwesomeIcons.square),
                                  Icon(FontAwesomeIcons.star),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem<String>(
                  value: 'shapeColor',
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.circle,
                      color: Colors.blue,
                    ),
                    title: Text('Shape Color'),
                    onTap: () {},
                  ),
                ),
              ],
            ),
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
              tooltip: 'New Sheet',
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
