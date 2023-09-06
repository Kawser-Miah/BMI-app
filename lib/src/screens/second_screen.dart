import 'package:flutter/material.dart';

class SecondScreenBody extends StatelessWidget{
  final double bmi;
  const SecondScreenBody({super.key, required this.bmi});

  @override
  Widget build(context){
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
            ),
            child: showResult(bmi),
          ),
        )
      ],
    );
  }

  Widget showResult(double bmi){
    String? position;
    Color? color;

    if(bmi <= 18.5){
      position = 'Underweight';
      color = Colors.blue.shade600;
    }else if(bmi > 18.5 && bmi <= 25.0){
      position = 'Normal';
      color = Colors.green;
    }else if(bmi > 25.0){
      position = 'Overweight';
      color = Colors.red.shade800;
    }
    return Center(
      child: Material(
        elevation: 3.0,
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          // color: Colors.black,
          height: 400.0,
          width: 370.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            border: Border.all(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$bmi",style:  TextStyle(
                    fontSize: 80.0,
                    color: Colors.orange.shade800,
                  ),),
                  const SizedBox(width: 10,),
                  Column(
                    children: [
                      Text('BMI',style: TextStyle(
                        fontSize: 35.0,
                         fontWeight: FontWeight.w500,
                         color: Colors.grey.shade600
                      ),),
                      Text(position!,style: TextStyle(
                          fontSize: 17.0,
                          color: color,
                      ),),
                    ],
                  )
                ],
              ),
              Material(
                shadowColor: Colors.grey.shade700,
                elevation: 3.0,
                child: Container(
                  color: Colors.grey.shade600,
                  height: 5.0,
                width: 310.0,
                ),
              ),

               const SizedBox(height: 20,),

              Text("Information",style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey.shade600
              ),),

              const SizedBox(height: 25,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Underweight',style: TextStyle(
                    color: Colors.blue.shade600,
                    fontSize: 15.0,
                  ),),
                  const Text('Normal',style: TextStyle(
                    color: Colors.green,
                    fontSize: 15.0,
                  ),),
                  Text('Overweight',style: TextStyle(
                    color: Colors.red.shade800,
                    fontSize: 15.0,
                  ),),
                ],
              ),

              const SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    shadowColor: Colors.blue.shade600,
                    elevation: 3.0,
                    borderRadius: const BorderRadius.horizontal(left: Radius.circular(5.0)),
                    child: Container(decoration:BoxDecoration(
                        color: Colors.blue.shade600,
                      borderRadius: const BorderRadius.horizontal(left: Radius.circular(5.0))
                    ),
                      height: 5.0,width: 103.33,),
                  ),
                  Material(
                      shadowColor: Colors.green,
                      elevation: 3.0,
                      child: Container(color: Colors.green,height: 5.0,width: 103.33,)),
                  Material(
                    shadowColor: Colors.red.shade800,
                    borderRadius: const BorderRadius.horizontal(right: Radius.circular(5.0)),
                    elevation: 3.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red.shade800,
                        borderRadius: const BorderRadius.horizontal(right: Radius.circular(5.0))
                      ),
                      height: 5.0,width: 103.33,),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('16.0',style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey.shade600,
                  ),),

                  Text('18.5',style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey.shade600,
                  ),),

                  Text('25.0',style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey.shade600,
                  ),),

                  Text('40.0',style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey.shade600,
                  ),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}