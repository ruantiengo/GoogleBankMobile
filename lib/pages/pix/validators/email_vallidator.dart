bool isEmailValid(String email) {
  if (email == "") {
    return false; // O endereço de e-mail não pode ser nulo
  }

  // Expressão regular para validar o formato do e-mail
  var regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  return regex.hasMatch(email);
}
