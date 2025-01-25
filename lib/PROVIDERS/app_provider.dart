import 'package:flutter/foundation.dart';

class AppProvider with ChangeNotifier {
  // Add your app-wide state management logic here

  // Example state variables
  bool _isFirstLaunch = true;

  bool get isFirstLaunch => _isFirstLaunch;

  void setFirstLaunchComplete() {
    _isFirstLaunch = false;
    notifyListeners();
  }
}
