import 'package:flutter/material.dart';
import '../block_provider/provider.dart';
import '../text_controller/text_controller_class.dart';
export '../text_controller/text_controller_class.dart';

class FirstScreenBody extends StatefulWidget {
  const FirstScreenBody({super.key});
  @override
  State<FirstScreenBody> createState() => FirstScreenBodyState();
}

class FirstScreenBodyState extends State<FirstScreenBody> {
  @override
  Widget build(context) {
    final bloc = Provider.of(context);
    return Container(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          StreamBuilder(
              stream: bloc.weight,
              builder: (context, snapShot) {
                return Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: bloc.changeWeight,
                    controller: controller.weightController,
                    decoration: InputDecoration(
                      labelText: 'Enter your weight',
                      labelStyle: const TextStyle(
                        fontSize: 15.0,
                      ),
                      errorText: snapShot.error?.toString() == '/'
                          ? null
                          : snapShot.error?.toString(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: const Icon(Icons.line_weight),
                    ),
                  ),
                );
              }),
          const SizedBox(
            height: 24.5,
          ),
          StreamBuilder(
              stream: bloc.heightFeet,
              builder: (context, snapShot) {
                return Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: bloc.changeHeightFeet,
                    controller: controller.heightFeetController,
                    decoration: InputDecoration(
                      labelText: 'Enter your height (in feet)',
                      labelStyle: const TextStyle(
                        fontSize: 15.0,
                      ),
                      errorText: snapShot.error?.toString() == '/'
                          ? null
                          : snapShot.error?.toString(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: const Icon(Icons.height),
                    ),
                  ),
                );
              }),
          const SizedBox(
            height: 24.5,
          ),
          StreamBuilder(
              stream: bloc.heightInch,
              builder: (context, snapShot) {
                return Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: bloc.changeHeightInch,
                    controller: controller.heightInchController,
                    decoration: InputDecoration(
                      labelText: 'Enter your height (in inch)',
                      labelStyle: const TextStyle(
                        fontSize: 15.0,
                      ),
                      errorText: snapShot.error?.toString() == '/'
                          ? null
                          : snapShot.error?.toString(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: const Icon(Icons.height),
                    ),
                  ),
                );
              }),
          const SizedBox(
            height: 20,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(height: 43, width: 145),
            child: StreamBuilder(
                stream: bloc.submitValid,
                builder: (context, snapShot) {
                  return Material(
                    elevation: 5.0,
                    shadowColor: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(5),
                    child: ElevatedButton.icon(
                        onPressed: snapShot.hasData
                            ? () {
                                //It's an variable
                                ({
                                  String weight,
                                  String heightFeet,
                                  String heightInch
                                }) details = bloc.submit();

                                String weight = details.weight;
                                String heightFeet = details.heightFeet;
                                String heightInch = details.heightInch;

                                if (weight != '' && weight !='/' &&
                                    heightFeet != '' && heightFeet != '/'&&
                                    heightInch != ''&& heightInch !='/') {
                                  int wt = int.parse(weight);
                                  int htF = int.parse(heightFeet);
                                  int htI = int.parse(heightInch);


                                  int totalHeightInch = (htF * 12) + htI;

                                  double heightMeter = totalHeightInch * 0.0254;

                                  double bmi = wt / (heightMeter * heightMeter);

                                  Navigator.pushNamed(
                                      context, '/${bmi.toStringAsFixed(1)}');
                                }
                                else{
                                  bloc.alert(weight, heightFeet, heightInch);
                                }
                              }
                            : (){
                          ({
                          String weight,
                          String heightFeet,
                          String heightInch
                          }) details = bloc.submit();

                          String weight = details.weight;
                          String heightFeet = details.heightFeet;
                          String heightInch = details.heightInch;
                          bloc.alert(weight, heightFeet, heightInch);

                        },
                        icon: const Icon(Icons.calculate_outlined),
                        label: const Text(
                          "Calculate",
                          style: TextStyle(fontSize: 17.0),
                        )),
                  );
                }),
          ),
          // SingleChildScrollView(child: SizedBox(height: 100,)),
          // SizedBox(height: 100,),
        ],
      ),
    );
  }
}
