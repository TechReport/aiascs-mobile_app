import 'package:aiascs_mobile/core/services/feedback_service/feedback_service.dart';
import 'package:aiascs_mobile/core/services/http_service/http_service.dart';
import 'package:aiascs_mobile/models/User.dart';
import 'package:aiascs_mobile/models/feedback.dart';
import 'package:flutter/foundation.dart';

class FeedbackState extends ChangeNotifier {
  List<FeedbackModel> _feedbackModel;
  int _feedbackCount;
  bool _isSubmitted;

  List<FeedbackModel> get feedbackModel => _feedbackModel ?? [];
  int get feedbackCount => _feedbackCount ?? 0;
  bool get isSubmitted => _isSubmitted ?? false;

  void onGetFeedbacksFromServer() async {
    _feedbackModel = await FeedbackService().getFeedbacks();
    _feedbackCount = feedbackModel.length;
    notifyListeners();
  }

 Future onPostFeedbacks(User user, desctription) async{
    _isSubmitted = true;
    notifyListeners();
    await HttpService().httpPostFeedback(user, desctription);
    _isSubmitted = false;
    notifyListeners();
  }
}
