import 'package:flutter/material.dart';

class DiceButton
    extends StatefulWidget {
  final int diceSide;
  const DiceButton({
    super.key,
    required this.diceSide,
  });

  @override
  State<DiceButton> createState() =>
      _DiceButtonState();
}

class _DiceButtonState
    extends State<DiceButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Text(
        "d${widget.diceSide}",
      ),
    );
  }
}
