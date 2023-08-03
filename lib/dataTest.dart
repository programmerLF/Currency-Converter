// will contain the method that fetches the data from the API

import 'package:http/http.dart';



         void main() {
  fetchAPIData();
}
    

  void fetchAPIData() async{
final Response response = await get(Uri.parse(
        "https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_CWyF35b55P9PtpANIMD1WMSm2ZD1J8h408R3bwkJ"));
        print(response.body);
        }



  
 