import 'package:flutter/material.dart';
import 'block_provider/provider.dart';
import 'widgets/scaffold_widgets.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "BMI",
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) {
        final bloc = Provider.of(context);
        bloc.clear('/');
        return const FirstScreenScaffold();
      });
    } else {
      return MaterialPageRoute(builder: (context) {
        final bmi = double.parse(settings.name!.replaceFirst('/', ''));
        return SecondScreenScaffold(bmi: bmi);
      });
    }
  }
}
