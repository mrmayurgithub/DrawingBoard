import 'package:drawing_app/providers/bg_color_provider.dart';
import 'package:drawing_app/providers/pen_type_provider.dart';
import 'package:drawing_app/providers/sheets_provider.dart';
import 'package:drawing_app/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle());
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
  @override
  Widget build(BuildContext context) {
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
      ],
      child: MaterialApp(
        home: DrawScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
