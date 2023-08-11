import 'package:desafio/src/modules/test_controller.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TestController();
    final numberHarshadEC = TextEditingController();
    final secondsEC = TextEditingController();

    var hoursResult = ValueNotifier("");
    var numberHarshad = ValueNotifier(false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            TextFormField(
              controller: numberHarshadEC,
              decoration: const InputDecoration(label: Text("Exercicio 1")),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  bool result = controller.isHarshad(int.parse(numberHarshadEC.text));
                  numberHarshad.value = result;
                },
                child: const Text("Verificar")),
            ValueListenableBuilder(
                valueListenable: numberHarshad,
                builder: (context, hour, _) {
                  return Text(hour.toString());
                }),
            const Divider(),
            TextFormField(
              controller: secondsEC,
              decoration: const InputDecoration(label: Text("Exercicio 2")),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  String result = controller.convertSecondsInhours(int.parse(secondsEC.text));
                  hoursResult.value = result;
                },
                child: const Text("Verificar")),
            ValueListenableBuilder(
                valueListenable: hoursResult,
                builder: (context, hour, _) {
                  return Text(hour);
                }),
          ],
        ),
      ),
    );
  }
}
