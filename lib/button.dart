import 'package:flutter/material.dart';

const Color ok = Colors.blue;
const Color myolor2 = Colors.green;

class button extends StatefulWidget {
  final String title;
  final VoidCallback onpress;
  final Color? mycolor;
  const button({
    super.key,
    required this.title,
    required this.onpress,
    this.mycolor,
  });

  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: widget.onpress,
        child: Container(
          width: 90,
          height: 70,
          decoration: BoxDecoration(
            color: widget.mycolor ?? Colors.orangeAccent,
            shape: BoxShape.circle,
            border: BoxBorder.all(
              color: Colors.white.withOpacity(.9),
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
