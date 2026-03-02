import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens/dicerollresultscreen.dart';

class DiceButton
    extends StatefulWidget {
  final int diceSide;

  DiceButton({
    super.key,
    required this.diceSide,
  });

  @override
  State<DiceButton> createState() =>
      _DiceButtonState();
}

class _DiceButtonState
    extends State<DiceButton> {
  final TextEditingController
  _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        "d${widget.diceSide}",
      ),
      onPressed: () async {
        final String?
        diceCount = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Zar adedi giriniz:",
              ),
              content: TextField(
                controller: _controller,
                inputFormatters: [
                  FilteringTextInputFormatter
                      .digitsOnly,
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      _controller.text,
                    );
                  },
                  child: Text("enter"),
                ),
              ],
            );
          },
        );
        if (diceCount == null ||
            diceCount.isEmpty) {
          return;
        } else if (diceCount == '0') {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "King of İdiots",
                ),
                content: Text(
                  "try different number NOT ZERO!",
                ),
                actions: [
                  TextButton(
                    onPressed: () =>
                        Navigator.pop(
                          context,
                        ),
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        } else {
          int count = int.parse(
            diceCount,
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DiceResult(
                    count: count,
                    side:
                        widget.diceSide,
                  ),
            ),
          );
        }
      },
    );
  }
}
