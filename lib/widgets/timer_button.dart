import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  final void Function()? action;
  final String text;
  final IconData icon;

  const TimerButton({super.key, this.action, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle: const TextStyle(
          fontSize: 15,
        ),
      ),
      onPressed: action,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(icon, size: 25),
          ),
          Text(text),
        ],
      ),
    );
  }
}
