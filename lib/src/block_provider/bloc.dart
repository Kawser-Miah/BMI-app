import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'validators.dart';


class Bloc with Validators{
  final _weight = BehaviorSubject<String>();
  final _heightFeet = BehaviorSubject<String>();
  final _heightInch = BehaviorSubject<String>();

  Stream<String> get weight => _weight.stream.transform(validateWeight);
  Stream<String> get heightFeet => _heightFeet.stream.transform(validateHeightFeet);
  Stream<String>  get heightInch => _heightInch.stream.transform(validateHeightInch);

  Stream<bool> get submitValid => Rx.combineLatest3(weight, heightFeet, heightInch, (w, hF, hI) => true);

  Function(String) get changeWeight => _weight.sink.add;
  Function(String) get changeHeightFeet => _heightFeet.sink.add;
  Function(String) get changeHeightInch => _heightInch.sink.add;

  ({String weight, String heightFeet, String heightInch})submit(){
    final validWeight = _weight.value;
    final validHeightFeet = _heightFeet.value;
    final validHeightInch = _heightInch.value;

    return(weight: validWeight, heightFeet: validHeightFeet, heightInch: validHeightInch);
  }

  alert(String weight, String heightFeet, String heightInch){
    if(weight == '/') {
      _weight.sink.add('');
    }
    if(heightFeet == '/') {
      _heightFeet.sink.add('');
    }
    if(heightInch == '/') {
      _heightInch.sink.add('');
    }
  }


  clear(String value){
    _weight.sink.add(value);
    _heightFeet.sink.add(value);
    _heightInch.sink.add(value);
  }
  dispose(){
    _weight.close();
    _heightFeet.close();
    _heightInch.close();
  }
}