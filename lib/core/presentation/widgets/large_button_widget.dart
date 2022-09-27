import 'package:flutter/material.dart';

class LargeButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String largeButtonText;
  const LargeButtonWidget({super.key, required this.largeButtonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 335,
          height: 46,
          child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: Colors.black,
              ),
              child: Center(
                child: Text(
                  largeButtonText,
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                ),
              )),
        ),
      ),
    );;
  }
}
