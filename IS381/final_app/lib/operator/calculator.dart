import 'package:flutter/cupertino.dart';

bool needToSave = false;
class Operator extends ChangeNotifier{
  String op = '';
  String outcome = '';
  bool equalIsTapped = false;
  bool is_minus = false;

  void tap(String tab){
    if(tab.compareTo('0') == 0 ||
    tab.compareTo('1') == 0 ||
    tab.compareTo('2') == 0 ||
    tab.compareTo('3') == 0 ||
    tab.compareTo('4') == 0 ||
    tab.compareTo('5') == 0 ||
    tab.compareTo('6') == 0 ||
    tab.compareTo('7') == 0 ||
    tab.compareTo('8') == 0 || 
    tab.compareTo('9') == 0 || 
    tab.compareTo('.') == 0){
      tab_number(tab);
    }
    if(tab.compareTo('C') == 0 || tab.compareTo('<-') == 0){
      delete();
    }
    if(tab.compareTo('CE') == 0){
      delete_all();
    }
    if(tab.compareTo('%') == 0){
      tab_percent(tab);
    }
    if(tab.compareTo('=') == 0){
      needToSave = true;
      tab_equal(tab);
    }
    if(tab.compareTo('+/-') == 0){
      tab_p_m();
    }
    if(tab.compareTo('+') == 0 || tab.compareTo('-') == 0){
      tab_plus_or_minus(tab);
    }
    if(tab.compareTo('x') == 0 || tab.compareTo('/') == 0){
      tab_times_or_divide(tab);
    }
  }

  void tab_p_m(){
    is_minus = !is_minus;
    notifyListeners();
  }

  double tab_equal(String tab){
    if(op != ''){
      if(!equalIsTapped){
        equalIsTapped = true;
        op = op + tab;
        Calculate c = Calculate(op);
        double o = c.calculate();
        if(is_minus) o = o-(o*2);
        outcome = o.toString();
        notifyListeners();
        return o;
      }
    }
  }

  double callM(){
    if(equalIsTapped){
      op = outcome;
      outcome = '';
      is_minus = false;
      return double.parse(op);
    }
    else return tab_equal('=');
  }

  void tab_percent(String tab){
    if(equalIsTapped){
      op = outcome;
      outcome = '';
      is_minus = false;
    }
    op = op + tab;
    notifyListeners();
  }

  void tab_plus_or_minus(String tab){
    if(equalIsTapped){
      op = outcome;
      outcome = '';
      is_minus = false;
      equalIsTapped = false;
    }
    op = op + tab;
    notifyListeners();
  }

  void tab_times_or_divide(String tab){
    if(equalIsTapped){
      op = outcome;
      outcome = '';
      is_minus = false;
      equalIsTapped = false;
    }
    op = op + tab;
    notifyListeners();
  }

  void tab_number(String tab){
    if(equalIsTapped){
      op = '';
      outcome = '';
      is_minus = false;
      equalIsTapped = false;
    }
    op = op + tab;
    notifyListeners();
  }

  void delete_all(){
    op = '';
    outcome = '';
    is_minus = false;
    notifyListeners();
  }

  void callMR(double value){
    op = value.toString();
    outcome = '';
    is_minus = false;
    equalIsTapped = false;
    notifyListeners();
  }

  void delete(){
    if(equalIsTapped) equalIsTapped = false;
    op = op.substring(0, op.length - 1);
    outcome = '';
    notifyListeners();
  }
}

class Calculate{
  final String value;
  List<double> allNumbers = [];
  List<String> allOps = [];

  Calculate(this.value);

  double calculate(){
    int startidx = 0;
    double outcome = 0;
    for(int i=0 ; i < value.length ; i++){
      if(value[i] == '+' || value[i] == '-' || value[i] == 'x' || value[i] == '/' || value[i] == '%' || value[i] == '='){
        if(value[i-1] != '%') allNumbers.add(double.parse(value.substring(startidx, i)));
        if(i == value.length - 1){
          allOps.add(value.substring(i));
        }else{
          allOps.add(value.substring(i, i+1));
        }
        startidx = i+1;
      }
    }
    for(int i = 0 ; i < allOps.length ; i++){
      if(allOps[i] == '%'){
        allNumbers[i] = allNumbers[i] / 100;
        allOps[i] = 'D';
      }
    }
    allOps.removeWhere((op) => op == 'D');
    for(int i = 0 ; i < allNumbers.length ; i++){
      if(allOps[i] == 'x'){
        allNumbers[i+1] = allNumbers[i] * allNumbers[i+1];
        allNumbers[i] = 0;
        allOps[i] = 'D';
      }
      if(allOps[i] == '/'){
        allNumbers[i+1] = allNumbers[i] / allNumbers[i+1];
        allNumbers[i] = 0;
        allOps[i] = 'D';
      }
    }
    allNumbers.removeWhere((number) => number == 0);
    allOps.removeWhere((op) => op == 'D');
    for(int i = 0 ; i < allOps.length ; i++){
      if(i == 0) outcome = allNumbers[i];
      // if(i != value.length - 1){
        if(allOps[i] == '+'){
          outcome = outcome + allNumbers[i+1];
        }
        if(allOps[i] == '-'){
          outcome = outcome - allNumbers[i+1];
        }
      }
    // }
    return outcome;
  }
}