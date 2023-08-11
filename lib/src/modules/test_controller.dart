import 'package:flutter/material.dart';

class TestController {
  bool isHarshad(int number) {
    if (number > 0) {
      String numberString = number.toString();
      int divisor = 0;
      for (var c in numberString.characters) {
        divisor += int.parse(c);
      }

      return (number % divisor) == 0;
    } else {
      return false;
    }
  }

  String convertSecondsInhours(int seconds) {
    if (seconds <= 359999) {
      int hours = seconds ~/ 3600;
      int minutes = (seconds % 3600) ~/ 60;
      int _seconds = seconds % 60;
      String ssp = _seconds.toString().padLeft(2, "0");
      String hh = hours.toString().padLeft(2, "0");
      String mm = minutes.toString().padLeft(2, "0");
      String ss = ssp.substring(0, 2);

      return "$hh:$mm:$ss";
    } else {
      return "Quantidade máxima de segundos atingida";
    }
  }

  String encrypt(String text, int n) {
    List<String> matriz = List.filled(n, ""); // iniciando a matriz vazia com n espaços vazios
    int rail = 0;
    int step = 1;
    for (int i = 0; i < text.length; i++) {
      String c = text[i];
      matriz[rail] = matriz[rail] + c;
      if (rail == n - 1)
        step = -1;
      else if (rail == 0) step = 1;
      rail += step;
    }
    return matriz.join();
  }

  String decrypt(String cipherText, int n) {
    List<String> matriz = List.filled(n, "");
    List<int> pattern = List.generate(n, (index) => index);
    int rail = 0;
    int step = 1;

    for (int i = 0; i < cipherText.length; i++) {
      matriz[rail] += '*'; // Preencher temporariamente com um caractere qualquer
      if (rail == n - 1) {
        step = -1;
      } else if (rail == 0) {
        step = 1;
      }
      rail += step;
    }

    int index = 0;
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < matriz[i].length; j++) {
        if (matriz[i][j] == '*') {
          matriz[i] = matriz[i].substring(0, j) + cipherText[index] + matriz[i].substring(j + 1);
          index++;
        }
      }
    }

    rail = 0;
    step = 1;
    String decryptedText = "";

    for (int i = 0; i < cipherText.length; i++) {
      decryptedText += matriz[rail][0];
      matriz[rail] = matriz[rail].substring(1);

      if (rail == n - 1) {
        step = -1;
      } else if (rail == 0) {
        step = 1;
      }
      rail += step;
    }

    return decryptedText;
  }
}
