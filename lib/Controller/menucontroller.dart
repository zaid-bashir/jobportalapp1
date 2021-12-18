import 'package:flutter/material.dart';
class MenuController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeys = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyss = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  GlobalKey<ScaffoldState> get scaffoldKeys => _scaffoldKeys;
  GlobalKey<ScaffoldState> get scaffoldKeyss => _scaffoldKeyss;

  void controlMenu() {
    if (!_scaffoldKey.currentState.isDrawerOpen) {
      _scaffoldKey.currentState.openDrawer();
    }
  }

  void controlMenu2() {
    if (!_scaffoldKeys.currentState.isDrawerOpen) {
      _scaffoldKeys.currentState.openDrawer();
    }
  }


  void controlMenu3() {
    if (!_scaffoldKeyss.currentState.isDrawerOpen) {
      _scaffoldKeyss.currentState.openDrawer();
    }
  }

}
