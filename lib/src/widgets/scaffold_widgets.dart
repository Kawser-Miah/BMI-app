import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/home_screen.dart';
import '../screens/second_screen.dart';
import '../screens/screen.dart';
import '../block_provider/provider.dart';

class FirstScreenScaffold extends StatefulWidget{
  const FirstScreenScaffold({super.key});

  @override
  createState()=>FirstScreenScaffoldState();
}


class FirstScreenScaffoldState extends State<FirstScreenScaffold> {
  @override
  Widget build(context) {
    final bloc = Provider.of(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async{
          final value = await showDialog(
              context: context,
              builder: (context)=> AlertDialog(
                title: const Text('Exit App'),
                content: const Text('Are you sure want to exit?'),
                actions: [
                  TextButton(onPressed: ()=> Navigator.of(context).pop(true), child: const Text('EXIT')),
                  TextButton(onPressed: ()=> Navigator.of(context).pop(false), child: const Text('NO')),
                ],
              ),);
          if(value != null){
            return Future.value(value);
          }else{
            return Future.value(false);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.deepPurple,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
                bloc.clear('/');
                controller.clearText();
            },
            child: const Icon(Icons.cleaning_services_outlined),
          ),
          appBar: AppBar(
            title: const Text("BMI Calculator"),
            elevation: 0.0,
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(context: context, builder: (context){
                      return SimpleDialog(
                        title: const Text('About'),
                        contentPadding: const EdgeInsets.all(20.0),
                        children: [
                          const Text("BMI Calculator App for measure the BMI(Body Mass Index) of our body."),
                          const SizedBox(height: 10.0,),
                          const Text("It's need the weight in kg and height in feet and inches."),
                          const SizedBox(height: 10.0,),
                          const Text('If yo have any question or problem contact me with Email:\n*****'),
                          TextButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, child: const Text('Cancel'))
                        ],
                      );
                    });
                  },
                  icon: const Icon(Icons.info_outline),
                  iconSize: 25.0),
              IconButton(
                  onPressed: () =>  showDialog<bool>(
                      context: context,
                      builder:(context){
                        return AlertDialog(
                          title: const Text('Exit App'),
                          content: const Text('Are you sure want to exit?'),
                          actions: [
                            TextButton(onPressed: ()=> SystemNavigator.pop(), child: const Text('EXIT')),
                            TextButton(onPressed: ()=> Navigator.of(context).pop(false), child: const Text('NO')),
                          ],
                        );
                      }),
                  icon: const Icon(Icons.logout_outlined),
                  iconSize: 25.0)
            ],
          ),
          body: const HomeScreen(),
        ),
      ),
    );
  }
}

class SecondScreenScaffold extends StatelessWidget {
  final double bmi;
  const SecondScreenScaffold({super.key, required this.bmi});

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text('Here Your BMI Result'),
        elevation: 0.0,
      ),
      body: SecondScreenBody(bmi: bmi),
    );
  }
}
