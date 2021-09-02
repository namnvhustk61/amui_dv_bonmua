
import 'dart:convert';



class Distribution{

  /*
  * file has static value
  * */
  
  static Distribution? _instance;
  Distribution._internal();
  factory Distribution(){
    _instance = _instance ?? new Distribution._internal();
    return _instance!;
  }

  void clearDistribution(){
    _instance = new Distribution._internal();
  }

}