import 'package:drawing_app/providers/sheetnumber_provider.dart';
import 'package:drawing_app/ui/constants/constants.dart';
import 'package:drawing_app/ui/styles/icon_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomLeftBar extends StatelessWidget {
  const BottomLeftBar({
    Key key,
  }) : super(key: key);
  void _launchURL() async => await canLaunch(githubUrl) ? await launch(githubUrl) : throw 'Could not launch $githubUrl';

  @override
  Widget build(BuildContext context) {
    var sheetnProv = Provider.of<SheetNumberProvider>(context, listen: false);
    return Container(
      child: Column(
        children: [
          IconButton(
            padding: EdgeInsets.all(8),
            icon: Icon(
              FontAwesomeIcons.arrowUp,
              color: iconColor,
              size: iconSize,
            ),
            onPressed: () {
              int n = sheetnProv.sheetNumber;
              sheetnProv.sheetNumber = --n;
              print('BOTTOM APPBAR: $n');
            },
          ),
          IconButton(
            padding: EdgeInsets.all(8),
            icon: Icon(
              FontAwesomeIcons.arrowDown,
              color: iconColor,
              size: iconSize,
            ),
            onPressed: () {
              int n = sheetnProv.sheetNumber;
              sheetnProv.sheetNumber = ++n;
              print('BOTTOM APPBAR: $n');
            },
          ),
          PopupMenuButton<String>(
            tooltip: 'Settings',
            icon: Icon(
              Icons.settings,
              color: iconColor,
              size: iconSize,
            ),
            onSelected: (String value) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'launchrepo',
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.github,
                    color: Colors.black,
                    size: iconSize,
                  ),
                  title: Text('Github Repository'),
                  onTap: () {
                    _launchURL();
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
