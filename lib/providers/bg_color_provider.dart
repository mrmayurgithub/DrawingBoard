import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BgColorProvider extends ChangeNotifier {
  Color _bgColor = Colors.white;
  Color get bgColor => _bgColor;
  set bgColor(Color val) {
    _bgColor = val;
    notifyListeners();
  }
}
