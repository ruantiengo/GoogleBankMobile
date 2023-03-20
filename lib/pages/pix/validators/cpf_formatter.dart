String formatCPF(String cpf) {
  cpf = cpf.padLeft(11, '0'); // add leading zeros if necessary
  return "${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}";
}
