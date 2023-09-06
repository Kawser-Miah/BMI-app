import 'dart:async';

mixin Validators {
  final validateWeight = StreamTransformer<String, String>.fromHandlers(
      handleData: (weight, sink) {
    if (weight != '' && weight != '/') {
      sink.add(weight);
    } else if (weight == '/') {
      sink.addError(weight);
    } else {
      sink.addError('Please fill the required blanks');
    }
  });

  final validateHeightFeet = StreamTransformer<String, String>.fromHandlers(
      handleData: (heightFeet, sink) {
    if (heightFeet != '' && heightFeet != '/') {
      sink.add(heightFeet);
    } else if (heightFeet == '/') {
      sink.addError(heightFeet);
    } else {
      sink.addError('Please fill the required blanks');
    }
  });

  final validateHeightInch = StreamTransformer<String, String>.fromHandlers(
      handleData: (heightInch, sink) {
    if (heightInch != '' && heightInch != '/') {
      sink.add(heightInch);
    } else if (heightInch == '/') {
      sink.addError(heightInch);
    } else {
      sink.addError('Please fill the required blanks');
    }
  });
}
