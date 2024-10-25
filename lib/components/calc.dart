import 'package:calculator/components/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  const Calc({super.key});

  @override
  State<Calc> createState() => _CalcScreen();
}

Color numColor = Colors.white10;
Color homeRowColor = Colors.white30;
Color sideColor = Colors.orange;
const int limitLength = 15;
class _CalcScreen extends State<Calc> {
  String input = '';

  void onChange(String value) {
      if (input.length < limitLength) {
    setState(() {
        input += value;
    });
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Length Limit $limitLength!",))
        );
      }
  }

  void clearInput(String value) {
    clear();
  }

  void evaluate(String value) {
    clear();
    print("Evaluation");
  }

  void clear() {
    setState(() {
      input = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Expanded(
                    //       child: Text(
                    //         input,
                    //         style: const TextStyle(
                    //             fontSize: 25, color: Colors.white30),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            textDirection: TextDirection.rtl,
                            input,
                            style: const TextStyle(
                                fontSize: 50, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(label: "AC", bg: homeRowColor, onClick: clearInput),
              Button(label: "+/-", bg: homeRowColor, onClick: onChange),
              Button(label: "%", bg: homeRowColor, onClick: onChange),
              Button(label: "/", bg: sideColor, onClick: onChange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(label: "7", bg: numColor, onClick: onChange),
              Button(label: "8", bg: numColor, onClick: onChange),
              Button(label: "9", bg: numColor, onClick: onChange),
              Button(label: "X", bg: sideColor, onClick: onChange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(label: "4", bg: numColor, onClick: onChange),
              Button(label: "5", bg: numColor, onClick: onChange),
              Button(label: "6", bg: numColor, onClick: onChange),
              Button(label: "-", bg: sideColor, onClick: onChange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(label: "1", bg: numColor, onClick: onChange),
              Button(label: "2", bg: numColor, onClick: onChange),
              Button(label: "3", bg: numColor, onClick: onChange),
              Button(label: "+", bg: sideColor, onClick: onChange)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(label: "M", bg: numColor, onClick: onChange),
              Button(label: "0", bg: numColor, onClick: onChange),
              Button(label: ".", bg: numColor, onClick: onChange),
              Button(label: "=", bg: sideColor, onClick: evaluate)
            ],
          ),
        ],
      ),
    );
  }
}
