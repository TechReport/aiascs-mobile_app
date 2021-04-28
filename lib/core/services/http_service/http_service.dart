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
    headers["Authorization"] = "Bearer  " + token;
    http.Response response = await http.get(httpUrl, headers: headers);
    return response;
  }

  Future<http.Response> httpPost(String url, Map<String, dynamic> postData,
      {String token = ""}) async {
    var httpUrl = Uri.parse(basicUrl + url);
    headers["Authorization"] = "Bearer  " + token;
    http.Response response =
        await http.post(httpUrl, headers: headers, body: json.encode(postData));
    return response;
  }

  Future<http.Response> htthPatch(String url, Map<String, dynamic> postData,
      {String token = ""}) async {
    var httpUrl = Uri.parse(basicUrl + url);
    headers["Authorization"] = "Bearer " + token;
    print("headers");
    print(headers.toString());
    http.Response response = await http.patch(httpUrl,
        headers: headers, body: json.encode(postData));
    return response;
  }

  Future<http.Response> httpPost1() async {
    print("in data");
    var httpUrl1 = Uri.parse("");
    Map<String, dynamic> postData = {
      "username": "e@gmail.com",
      "password": "1234"
    };
    http.Response response = await http.post(httpUrl1,
        headers: headers, body: json.encode(postData));
    print(response.body);
    return response;
  }
}
