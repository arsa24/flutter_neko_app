import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  final String text;
  final Function() onTogle;
  final bool value;

  const ToggleButton(
      {super.key,
      required this.text,
      required this.onTogle,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: onTogle,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 50,
            height: 26,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: value ? Colors.blue : Colors.grey[400],
            ),
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment:
                  value ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
