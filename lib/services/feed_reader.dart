// import 'package:crypto_monitor/models/news_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = '046086b8911b680b3a5886298cac5cac6c0ca523';
const feedReaderUrl  = 'https://cryptopanic.com/api/v1/posts/';

class FeedReader{


  String url;

  Future getData() async{
    http.Response response = await http.get('$feedReaderUrl?auth_token=$apiKey');
    if (response.statusCode == 200 ){
      String data = response.body;
      var decodedData = json.decode(data);
      return decodedData;

    }
    else{
      print('ERROR');
      print(response.statusCode);
      print(response.body);

      return [];
    }
  }

}

