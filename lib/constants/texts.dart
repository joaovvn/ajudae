class Texts {
  static String welcome(String name) {
    return "Bem-vindo, $name";
  }

  static String claim = "Manifestação";
  static String selectClaim =
      "Selecione o tipo de manifestação que você desejar fazer, a fim de resolvermos o quanto antes";
  static String followUp = "Acompanhe aqui";
  static String followClaims =
      "Verifique e avalie se suas manifestações foram resolvidas";
  static String highlights = "Destaques";
  static String claimsAround = "Manifestações ao redor";
  static String claimsSearch =
      "Procure pela área onde deseja verificar a ocorrência de manifestações.";

  static String getClaimName(int claimTypeId) {
    switch (claimTypeId) {
      case 1:
        return "Coleta de lixo";
      case 2:
        return "Buraco na rua";
      case 3:
        return "Iluminação pública";
      case 4:
        return "Semáforo";
      default:
        return "";
    }
  }
}
