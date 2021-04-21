import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  final String basicUrl = "https://secret-ridge-42311.herokuapp.com";

  Future<http.Response> httpGet(String url, {String token = ""}) async {
    var httpUrl = Uri.parse(basicUrl + url);
        headers["Authorization"] = "Bearer  "+token;
    http.Response response =
        await http.get(httpUrl, headers: headers);
    return response;
  }

  Future<http.Response> httpPost(
      String url, Map<String, dynamic> postData ,{String token = ""}) async {
    var httpUrl = Uri.parse(basicUrl + url);
       headers["Authorization"] = "Bearer  "+token;
    http.Response response =
        await http.post(httpUrl, headers: headers, body: json.encode(postData));
    return response;
  }
}
