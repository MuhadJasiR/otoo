import 'package:flutter/material.dart';

class LocalFunctionsProvider extends ChangeNotifier {
  int index = 0;
  changeIndex(int currentIdx) {
    index = currentIdx;
    notifyListeners();
  }
}
