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
     CalculatorProvider calculate =
      Provider.of<CalculatorProvider>(context);
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
                        calculate.userQuestion,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                        child: Text(
                          calculate.userAnswer,
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
                  itemCount: calculate.buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return MyButton(
                        buttonTapped: () => calculate.eraseAll(),
                        color: Colors.green,
                        textColor: Colors.white,
                        buttonText: calculate.buttons[index],
                      );
                    } else if (index == 1) {
                      return MyButton(
                        buttonTapped: () => calculate.deleteButton(),
                        color: Colors.red,
                        textColor: Colors.white,
                        buttonText: calculate.buttons[index],
                      );
                    } else if (index == calculate.buttons.length - 1) {
                      return MyButton(
                        buttonTapped: () => calculate.showAnswer(),
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                        buttonText: calculate.buttons[index],
                      );
                    } else {
                      return MyButton(
                        buttonTapped: () => calculate.buttonPushed(index),
                        color: calculate.isOperator(calculate.buttons[index])
                            ? Colors.deepPurple
                            : Colors.deepPurple[50],
                        textColor:
                            calculate.isOperator(calculate.buttons[index])
                                ? Colors.white
                                : Colors.deepPurple,
                        buttonText: calculate.buttons[index],
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
