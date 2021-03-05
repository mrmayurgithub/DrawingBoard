import 'package:flutter/widgets.dart';

class SheetsViewProvider extends ChangeNotifier {
  bool _isGrid = true;
  bool get isGrid => _isGrid;
  set isGrid(bool val) {
    _isGrid = val;
    notifyListeners();
  }
}
