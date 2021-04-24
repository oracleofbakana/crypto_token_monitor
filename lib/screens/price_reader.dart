// import 'package:crypto_monitor/models/news_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = '3892f058-dafd-45ef-81fe-bb310e8134da';
const apiUrl  = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest';

class PriceReader{


  String url;


  Future<List> getData() async{

    // var response = await http.get(
    //     "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=5000&convert=USD",
    //     headers: {
    //       'X-CMC_PRO_API_KEY': 'your-key',
    //       "Accept": "application/json",
    //     });
    //
    http.Response response = await http.get(apiUrl,
        headers: {"X-CMC_PRO_API_KEY": apiKey,
          "Accept": "application/json",});
    if (response.statusCode == 200 ){
      Map<String, dynamic> responsePayload = new Map<String, dynamic>.from(json.decode(response.body));
      return responsePayload['data'];

    }
    else{
      print('ERROR');
      print(response.body);
      return [];
    }
  }
}
