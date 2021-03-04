import 'package:drawing_app/ui/constants/constants.dart';
import 'package:drawing_app/ui/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle());
  if (kIsWeb) {
    // Increase Skia cache size to support bigger images.
    const int megabyte = 1000000;
    SystemChannels.skia.invokeMethod('Skia.setResourceCacheMaxBytes', 512 * megabyte);
    // TODO: cant' await on invokeMethod due to https://github.com/flutter/flutter/issues/77018  so awaiting on Future.delayed instead.
    await Future<void>.delayed(Duration.zero);
  }
  runApp(MaterialApp(
    home: DrawScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Slider(
          value: brushWidth,
          min: 4,
          max: 40,
          onChanged: (value) {
            setState(() {
              brushWidth = value;
            });
          },
        ),
      ),
    );
  }
}
