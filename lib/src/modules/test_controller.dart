class TestController {
  bool isHarshad(int number) {
    int initialNumber = 0;
    while (number > 0) {
      initialNumber += number % 10;
      number ~/= 10;
    }
    return number % initialNumber == 0;
  }

  String convertSecondsInhours(int seconds) {
    // 3600
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

  static String encode(String plaintext, int numberOfRows) {
    var railLength = plaintext.length ~/ numberOfRows + 1;
    var rails = List.generate(numberOfRows, (_) => StringBuffer());
    var currentRow = 0;
    var goingUp = true;
    for (var i = 0; i < plaintext.length; i++) {
      rails[currentRow].write(plaintext[i]);
      if (goingUp) {
        currentRow++;
        if (currentRow == numberOfRows) {
          goingUp = false;
          currentRow--;
        }
      } else {
        currentRow--;
        if (currentRow == -1) {
          goingUp = true;
          currentRow++;
        }
      }
    }
    return rails.map((r) => r.toString()).join();
  }

  static String decode(String ciphertext, int numberOfRows) {
    var railLength = ciphertext.length ~/ numberOfRows + 1;
    var rails = List.generate(numberOfRows, (_) => StringBuffer());
    var currentRow = 0;
    var goingUp = true;
    for (var i = 0; i < ciphertext.length; i++) {
      for (var j = 0; j < numberOfRows; j++) {
        if (ciphertext[i] == rails[j].length) {
          currentRow = j;
          goingUp = !goingUp;
          break;
        }
      }
      rails[currentRow].write(ciphertext[i]);
    }
    return rails.map((r) => r.toString()).join();
  }
}
