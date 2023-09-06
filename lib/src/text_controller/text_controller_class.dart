import 'package:flutter/cupertino.dart';

class TextController{
  final weightController = TextEditingController();
  final heightFeetController = TextEditingController();
  final heightInchController = TextEditingController();

  void clearText(){
    String str = weightController.text;
    weightController.text = str.substring(0,str.length-str.length);
    // weightController.clear();
    heightFeetController.clear();
    heightInchController.clear();
  }
}

TextController controller = TextController();