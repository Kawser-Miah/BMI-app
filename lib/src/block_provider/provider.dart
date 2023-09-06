import 'package:flutter/material.dart';
import '../block_provider/bloc.dart';
export '../block_provider/bloc.dart';

class Provider extends InheritedWidget {
  final Bloc bloc = Bloc();

  Provider({super.key, required super.child});

  @override
  bool updateShouldNotify(oldWidget) => true;

  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .bloc;
  }
}
