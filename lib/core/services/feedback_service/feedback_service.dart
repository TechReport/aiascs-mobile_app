import 'dart:convert';

import 'package:aiascs_mobile/core/services/http_service/http_service.dart';
import 'package:aiascs_mobile/models/feedback.dart';
import 'package:http/http.dart';

class FeedbackService {
  Future<List<FeedbackModel>> getFeedbacks() async {
    String secondaryUrl = "/api/v1/feedback/farmer";
    Response response = await HttpService().httpGet(secondaryUrl);
    print(json.decode(response.body));
    List<FeedbackModel> feedbackModel = [];
    if (response.statusCode == 201) {
      for (dynamic data in json.decode(response.body)) {
        feedbackModel.add(FeedbackModel.fromJson(data));
      }
      return feedbackModel;
    }
    return [];
  }
}
