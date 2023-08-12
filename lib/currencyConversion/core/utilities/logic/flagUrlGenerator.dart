

class FlagUrlGenerator{

// the following method generates a url string same as the url needed by the api to get the currency flag and use it 
static String generateFlagUrl(String currencyCode){
  String code = currencyCode.substring(0,2).toLowerCase();
  return "https://flagcdn.com/40x30/$code.png";
}

}