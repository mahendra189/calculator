import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double size = 80;

class Button extends StatelessWidget {
  final String label;
  final Color bg;
  final dynamic onClick;
  const Button({super.key, required this.label,required this.bg,required this.onClick});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Tapped! $label");
        onClick(label);
      },
      child: Container(
        width: size,
        height: size,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
