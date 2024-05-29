import 'package:flutter/material.dart';

class DropdownState extends ChangeNotifier {
  String _value = 'Nepali';

  String get value => _value;

  set value(String newValue) {
    _value = newValue;
    notifyListeners();
  }
}
