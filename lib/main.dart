import 'package:drawing_app/providers/bg_color_provider.dart';
import 'package:drawing_app/providers/pen_type_provider.dart';
import 'package:drawing_app/providers/sheetnumber_provider.dart';
import 'package:drawing_app/providers/sheets_provider.dart';
import 'package:drawing_app/ui/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  // if (kIsWeb) {
  //   // Increase Skia cache size to support bigger images.
  //   const int megabyte = 1000000;
  //   SystemChannels.skia.invokeMethod('Skia.setResourceCacheMaxBytes', 512 * megabyte);
  //   // TOD: cant' await on invokeMethod due to https://github.com/flutter/flutter/issues/77018  so awaiting on Future.delayed instead.
  //   await Future<void>.delayed(Duration.zero);
  // }
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (
        BuildContext context,
        AsyncSnapshot<dynamic> snapshot,
      ) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: SheetsViewProvider(),
            ),
            ChangeNotifierProvider.value(
              value: BgColorProvider(),
            ),
            ChangeNotifierProvider.value(
              value: PenEraserProvider(),
            ),
            ChangeNotifierProvider.value(
              value: SheetNumberProvider(),
            ),
          ],
          child: MaterialApp(
            title: 'DrawingBoard',
            home: DrawScreen(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
