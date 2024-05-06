import 'dart:io';

void main() {
  infovalut();
  dannye();
}

void infovalut() {
  double usd = 89.70;
  double eur = 95.70;
  double rub = 0.97;
  double krw = 15.29;

  print(
      'Добрый день!\nКурс на сегодня:\nUSD: $usd\nEUR: $eur\nRUB: $rub\nKRW: $krw\n\n\n');
}

void dannye() {
  print(
      '1) Хотите обменять другую валюту на сом?\n2) Хотите обменять сом на другую валюту?\n(Прошу ввести номер подходящего варианта)\n');

  int? sol = int.tryParse(stdin.readLineSync() ?? '');
  print('\n\n');

  while (checksol(sol)) {
    print('Ошибка!\nПовторите попытку!');
    sol = int.tryParse(stdin.readLineSync() ?? '');
  }

  if (sol == 1) {
    print('Какую валюту вы продаете?\nUSD\nEUR\nRUB\nKRW\n\n');
  } else if (sol == 2) {
    print('Какую валюту вы покупаете?\nUSD\nEUR\nRUB\nKRW\n\n');
  }

  String currency = stdin.readLineSync()!;
  print('\n');

  while (checkcurrency(currency)) {
    print('Ошибка!\nПовторите попытку!');
    currency = stdin.readLineSync()!;
  }

  if (sol == 1) {
    print('Введите сумму в валюте,которую вы хотите конвертировать в сомы\n\n');
  } else if (sol == 2) {
    print('Сколько вы хотите приобрести?\n\n');
  }
  int? summa = int.tryParse(stdin.readLineSync() ?? '');

  while (checksumma(summa)) {
    print('Ошибка!\nПовторите попытку!');
    summa = int.tryParse(stdin.readLineSync() ?? '');
  }

  double obmen;
  switch (sol) {
    case 1:
      obmen = exCurr(currency);
      double end = obmen * summa!;
      print('$summa $currency на $end som');
      break;
    case 2:
      obmen = exCurr(currency);
      double end = summa! * obmen;
      print('$end som на $summa $currency');
      break;
    default:
  }
  print('Хотите продолжтить? Y/N');
  String choice = stdin.readLineSync()!;
  if (choice.toLowerCase() == 'y') {
    dannye();
  } else {
    print('Благодарим, что используете наш сервис!\nДо скорых встреч.');
  }
}

double exCurr(String currency) {
  switch (currency) {
    case 'usd':
      return 89.70;
    case 'eur':
      return 95.70;
    case 'rub':
      return 0.97;
    case 'krw':
      return 15.29;
    default:
      return 0.0;
  }
}

bool checksol(int? sol) {
  if (sol == null) {
    return true;
  }
  if (sol != 1 && sol != 2) {
    print('Неверный выбор операции.');
    return true;
  } else {
    return false;
  }
}

bool checksumma(int? summa) {
  if (summa == null) {
    return true;
  } else {
    return false;
  }
}

bool checkcurrency(String currency) {
  if (currency.toLowerCase() != 'usd' &&
      currency.toLowerCase() != 'eur' &&
      currency.toLowerCase() != 'rub' &&
      currency.toLowerCase() != 'krw') {
    return true;
  } else {
    return false;
  }
}
