import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String? url;
  NetworkHelper({this.url});

  getData() async {
    Uri uri = Uri.parse( url!); 
    http.Response response = await http.get(uri);
    var decodedData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
