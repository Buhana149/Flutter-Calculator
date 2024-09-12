import 'package:flutter/material.dart';
import 'package:flutter_calculator/buttons.dart';
import 'package:flutter_calculator/providers/calculator_provider.dart';
import 'package:provider/provider.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorProvider>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        value.userQuestion,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                        child: Text(
                          value.userAnswer,
                          style: const TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                  itemCount: value.buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    switch (index) {
                      case 0:
                        return CalculatorButton(
                          buttonTapped: () => value.eraseAll(),
                          color: Colors.green,
                          textColor: Colors.white,
                          buttonText: value.buttons[index],
                        );
                      case 1:
                        return CalculatorButton(
                          buttonTapped: () => value.deleteButton(),
                          color: Colors.red,
                          textColor: Colors.white,
                          buttonText: value.buttons[index],
                        );
                      case var lastIndex when index == value.buttons.length - 1:
                        return CalculatorButton(
                          buttonTapped: () => value.showAnswer(),
                          color: Colors.deepPurple,
                          textColor: Colors.white,
                          buttonText: value.buttons[index],
                        );
                      default:
                        return CalculatorButton(
                          buttonTapped: () => value.buttonPushed(index),
                          color: value.isOperator(value.buttons[index])
                              ? Colors.deepPurple
                              : Colors.deepPurple[50],
                          textColor: value.isOperator(value.buttons[index])
                              ? Colors.white
                              : Colors.deepPurple,
                          buttonText: value.buttons[index],
                        );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
