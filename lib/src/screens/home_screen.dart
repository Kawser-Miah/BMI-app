import 'package:flutter/material.dart';
import 'screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  createState()=> HomeScreenState();
}


class HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 80.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    shadowColor: Colors.deepPurple,
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(70.0),
                    elevation: 5.0,
                    child: CircleAvatar(
                      radius: 66.0,
                      child: CircleAvatar(
                        radius: 63.0,
                        backgroundColor: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "B",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 55.0,
                                fontFamily: 'BlackOpsOne',
                              ),
                            ),
                            Text(
                              "M",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 55.0,
                                fontFamily: 'BlackOpsOne',
                              ),
                            ),
                            Text("I",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 55.0,
                                  fontFamily: 'BlackOpsOne',
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 72.0,),

                  const FirstScreenBody(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
