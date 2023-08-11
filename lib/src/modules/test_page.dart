import 'package:desafio/src/modules/test_controller.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Fiz o gerenciamento de estado com valueNotier
    // mais pra mostrar que conheço de geranciamento de estado
    final controller = TestController();
    final numberHarshadEC = TextEditingController();
    final secondsEC = TextEditingController();
    final encryptEC = TextEditingController();
    var hoursResult = ValueNotifier("");
    var numberHarshad = ValueNotifier(false);
    var encryptResult = ValueNotifier("");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextFormField(
              controller: numberHarshadEC,
              decoration: const InputDecoration(label: Text("Exercicio 1"), border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 50),
            TextFormField(
              controller: secondsEC,
              decoration: const InputDecoration(label: Text("Exercicio 2"), border: OutlineInputBorder()),
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
            const SizedBox(height: 50),
            TextFormField(
              controller: encryptEC,
              decoration: const InputDecoration(label: Text("Exercicio 3"), border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      String result = controller.encrypt(encryptEC.text, 3);
                      encryptResult.value = result;
                    },
                    child: const Text("Encrypt")),
                ElevatedButton(
                    onPressed: () {
                      String result = controller.decrypt(encryptEC.text, 3);
                      encryptResult.value = result;
                    },
                    child: const Text("Decrypt")),
              ],
            ),
            ValueListenableBuilder(
                valueListenable: encryptResult,
                builder: (context, encrypt, _) {
                  return Text(encrypt);
                }),
          ],
        ),
      ),
    );
  }
}
