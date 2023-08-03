

class FlagUrlGenerator{

static String generateFlagUrl(String currencyCode){
  String code = currencyCode.substring(0,2);
  return "https://flagcdn.com/40x30/$code.png";
}

}