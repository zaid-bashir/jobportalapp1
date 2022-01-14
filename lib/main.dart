import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Views/Home/splashscreen.dart';
import 'dart:ui' as ui;

void main() {
  RenderErrorBox.backgroundColor = Colors.transparent;
  RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
}
