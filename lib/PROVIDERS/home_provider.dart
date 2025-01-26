import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool _isTextExpanded = false;
  bool _isMusicInfoExpanded = false;

  bool get isTextExpanded => _isTextExpanded;
  bool get isMusicInfoExpanded => _isMusicInfoExpanded;

  void toggleTextExpansion() {
    _isTextExpanded = !_isTextExpanded;
    notifyListeners();
  }

  void toggleMusicInfoExpansion() {
    _isMusicInfoExpanded = !_isMusicInfoExpanded;
    notifyListeners();
  }
}
