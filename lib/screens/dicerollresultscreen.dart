import 'package:flutter/material.dart';
import 'dart:math';
import 'package:lottie/lottie.dart';

List<int> diceing(int side, int count) {
  List<int> diceList = [];
  var rng = Random();
  for (var i = 0; i < count; i++) {
    diceList.add(rng.nextInt(side) + 1);
  }
  return diceList;
}

class DiceResult
    extends StatefulWidget {
  final int count;
  final int side;
  const DiceResult({
    super.key,
    required this.side,
    required this.count,
  });

  @override
  State<DiceResult> createState() =>
      _DiceResultState();
}

class _DiceResultState
    extends State<DiceResult> {
  List<int> results = [];
  int total = 0;
  bool isRolling = true;

  @override
  void initState() {
    super.initState();
    results = diceing(
      widget.side,
      widget.count,
    );
    total = 0;
    for (int dice in results) {
      total += dice;
    }

    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (!mounted) {
          return;
        }

        setState(() {
          isRolling = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isRolling
            ? Column(
                mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                children: [
                  Lottie.asset(
                    'assets/animations/dice6.json',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Dice rolling!!",
                    style: TextStyle(
                      color:
                          Color.fromARGB(
                            255,
                            255,
                            163,
                            7,
                          ),
                      fontSize: 30,
                    ),
                  ),
                ],
              )
            : Column(
                // SONUÇLAR GÖRÜNECEK KISIM
                mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                children: [
                  Text(
                    "total damage: $total",
                    style:
                        const TextStyle(
                          fontSize: 40,
                          fontWeight:
                              FontWeight
                                  .bold,
                          color: Colors
                              .amber,
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Gelen Zarlar: ${results.join(' - ')}",
                    style: const TextStyle(
                      fontSize: 25,
                      color:
                          Color.fromARGB(
                            255,
                            255,
                            193,
                            7,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.pop(
                          context,
                        ),
                    child: const Text(
                      "Geri Dön",
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
