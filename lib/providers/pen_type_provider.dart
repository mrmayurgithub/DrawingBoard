import 'package:drawing_app/enums/poe_type_enum.dart';
import 'package:flutter/widgets.dart';

class PenEraserProvider extends ChangeNotifier {
  PenEraser _penEraser = PenEraser.Pen;
  PenEraser get penEraser => _penEraser;
  set penEraser(PenEraser val) {
    _penEraser = val;
    notifyListeners();
  }
}
