class InvalidNameException implements Exception {
  String error() => "O nome não foi digitado! Por favor, informe o seu nome.";

  @override
  String toString() {
    return error();
  }
}
