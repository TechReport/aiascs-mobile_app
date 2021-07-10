import 'dart:convert';
import 'dart:io';
import 'package:aiascs_mobile/models/User.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:dio/dio.dart';

//
// Name: Danford Kija David
// Email: kijadanford@gmail.com,
// phoneNo: +255620419226
//
// => "GROWING WITH AGILE"
//

class HttpService {
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  final String basicUrl = "https://secret-ridge-42311.herokuapp.com";
  final String locationAPI = "https://tanzaniatx.herokuapp.com";

  Future<http.Response> httpGet(String url, {String token = ""}) async {
    var httpUrl = Uri.parse(basicUrl + url);
    headers["Authorization"] = "Bearer " + token;
    http.Response response = await http.get(httpUrl, headers: headers);
    return response;
  }

  Future<http.Response> getThirdHttp(String secondaryUrl) async {
    var url = Uri.parse(locationAPI + secondaryUrl);
    http.Response response = await http.get(url, headers: headers);
    return response;
  }

  Future<http.Response> httpPost(String url, Map<String, dynamic> postData,
      {String token = ""}) async {
    var httpUrl = Uri.parse(basicUrl + url);
    headers["Authorization"] = "Bearer " + token;
    http.Response response =
        await http.post(httpUrl, headers: headers, body: json.encode(postData));

    return response;
  }

  Future<http.Response> htthPatch(String url, Map<String, dynamic> postData,
      {String token = ""}) async {
    var httpUrl = Uri.parse(basicUrl + url);
    headers["Authorization"] = "Bearer " + token;

    http.Response response = await http.patch(httpUrl,
        headers: headers, body: json.encode(postData));
    return response;
  }

  Future fileData(String filename, Map<String, String> postData, String url,
      {String token = ""}) async {
    var httpUrl = Uri.parse(basicUrl + url);
    headers["Authorization"] = "Bearer " + token;
    var request = http.MultipartRequest('POST', httpUrl);
    request.headers.addAll(headers);
    request.files.add(http.MultipartFile('photo',
        File(filename).readAsBytes().asStream(), File(filename).lengthSync(),
        filename: filename.split("/").last));
    request.fields.addAll(postData);
    var res = await request.send().then((response) {
      print(response.statusCode);
    });
  }

  Future<http.Response> httpPostFeedback(User user, String data,
      {String token = ""}) async {
    var httpUrl = Uri.parse(
        "https://secret-ridge-42311.herokuapp.com/api/v1/feedback/verify");
    http.Response response = await http.post(httpUrl,
        headers: headers,
        body: json.encode({"message": data, "fromID": user.id}));
   
    return response;
  }

  Future<Map<String, dynamic>> postData(
      Map<String, dynamic> body, String filePath, String url,
      {String token = ""}) async {
    var dio = Dio();
    var httpUrl = basicUrl + url;
    headers["Authorization"] = "Bearer " + token;
    // body.addAll();

    headers["Authorization"] = "Bearer " + token;
    dio.options.headers = headers;

    body.addAll({
      "photo": await MultipartFile.fromFile(
        filePath,
        filename: "upload_file",
      ),
    });
    FormData formData = new FormData.fromMap(body);
    var response = await dio.post(
      httpUrl,
      data: formData,
    );
    return response.data;
  }
}
