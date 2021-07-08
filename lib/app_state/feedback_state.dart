import 'package:aiascs_mobile/core/services/feedback_service/feedback_service.dart';
import 'package:aiascs_mobile/models/feedback.dart';
import 'package:flutter/foundation.dart';

class FeedbackState extends ChangeNotifier {
  List<FeedbackModel> _feedbackModel;
  int _feedbackCount;

  List<FeedbackModel> get feedbackModel => _feedbackModel ?? [];
  int get feedbackCount => _feedbackCount ?? 0;

  void onGetFeedbacksFromServer() async {
    _feedbackModel = await FeedbackService().getFeedbacks();
    _feedbackCount = feedbackModel.length;
    notifyListeners();
  }
}
