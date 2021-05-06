import 'package:flutter/cupertino.dart';

class Memory extends ChangeNotifier{
  double _memory = 0;

  void plus_memory(double value){
    _memory = _memory + value;
    notifyListeners();
  }

  void minus_memory(double value){
    _memory = _memory - value;
    notifyListeners();
  }

  void clear_memory(){
    _memory = 0;
    notifyListeners();
  }

  double send_memory(){
    return _memory;
  }
}