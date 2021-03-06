import 'package:flutter/widgets.dart';

class EraserProvider extends ChangeNotifier {
  bool _isEraser = false;
  bool get isEraser => _isEraser;
  set isEraser(bool val) {
    _isEraser = val;
    notifyListeners();
  }
}
