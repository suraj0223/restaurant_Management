import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiCalls {
  String baseUrl = 'https://restro-c6842-default-rtdb.firebaseio.com/';

  Future<bool> bookPostCall(
      {required dynamic payload, required String collection}) async {
    dynamic url = baseUrl + "$collection.json";
    dynamic finalUrl = Uri.parse(url);
    dynamic response = await http.post(finalUrl, body: json.encode(payload));
    return response != null && response.statusCode == 200;
  }

  dynamic getDataFromDb({required dynamic collection}) async {
    dynamic url = baseUrl + "$collection.json";
    dynamic finalUrl = Uri.parse(url);
    final response = await http.get(finalUrl);
    final data = json.decode(response.body);
    // print(response.statusCode);
    
    List mappedData = [];
    data.forEach((key, value) {
      mappedData.add(value);
    });
    return mappedData;
  }
}
