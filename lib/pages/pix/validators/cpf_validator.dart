bool isCPFValid(String cpf) {
  if (cpf == "" || cpf.length != 11) {
    return false; // O CPF deve ter 11 dígitos
  }

  var digits = cpf.split('').map(int.parse).toList();

  // Calcula o primeiro dígito verificador
  var sum = 0;
  for (var i = 0; i < 9; i++) {
    sum += digits[i] * (10 - i);
  }
  var dv1 = (sum * 10) % 11;
  if (dv1 == 10) {
    dv1 = 0;
  }

  // Calcula o segundo dígito verificador
  sum = 0;
  for (var i = 0; i < 10; i++) {
    sum += digits[i] * (11 - i);
  }
  var dv2 = (sum * 10) % 11;
  if (dv2 == 10) {
    dv2 = 0;
  }

  // Verifica se os dígitos verificadores são iguais aos últimos dois dígitos do CPF
  return digits[9] == dv1 && digits[10] == dv2;
}
