import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
class SpManager
{

    
     SharedPreferences _sharedPreferences;
 
   Future<bool> init() async{
      _sharedPreferences= await SharedPreferences.getInstance();

     return true;
  }
   String getString(String key){
     return _sharedPreferences.getString(key);
  }

    saveString(String key,String value){
    _sharedPreferences.setString(key, value);
  }

   deleteString(String key){
    _sharedPreferences.remove(key);
  }
}

