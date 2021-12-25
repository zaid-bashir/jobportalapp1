import 'package:flutter/material.dart';
import 'package:job_portal/Views/Home/uiview/slider_layout_view.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: onBordingBody(),
    );
  }
Widget  onBordingBody() => Container(
  child: SliderLayoutView(),
);
}
