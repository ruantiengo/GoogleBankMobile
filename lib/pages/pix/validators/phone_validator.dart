bool isPhoneValid(String phone) {
  if (phone == "" || phone.length != 11) {
    return false; // O número de telefone deve ter 11 dígitos
  }

  var digits = phone.split('').map(int.parse).toList();

  // Verifica se o primeiro dígito é 0 (código de área)
  if (digits[0] != 0) {
    return false;
  }

  // Verifica se os dois próximos dígitos formam um código de área válido
  var areaCode = digits.sublist(1, 3).join();
  var validAreaCodes = [
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '21',
    '22',
    '24',
    '27',
    '28',
    '31',
    '32',
    '33',
    '34',
    '35',
    '37',
    '38',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '51',
    '53',
    '54',
    '55',
    '61',
    '62',
    '63',
    '64',
    '65',
    '66',
    '67',
    '68',
    '69',
    '71',
    '73',
    '74',
    '75',
    '77',
    '79',
    '81',
    '82',
    '83',
    '84',
    '85',
    '86',
    '87',
    '88',
    '89',
    '91',
    '92',
    '93',
    '94',
    '95',
    '96',
    '97',
    '98',
    '99'
  ];
  if (!validAreaCodes.contains(areaCode)) {
    return false;
  }

  // Verifica se os próximos dígitos formam um número de telefone válido
  var phoneNumber = digits.sublist(3).join();
  if (phoneNumber.startsWith('0') || phoneNumber.startsWith('1')) {
    return false; // O número não pode começar com 0 ou 1
  }

  // Se chegou até aqui, o número de telefone é válido
  return true;
}
