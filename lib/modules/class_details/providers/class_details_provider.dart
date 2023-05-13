import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_programming/modules/class_details/controllers/class_details_controller.dart';
import 'package:learn_programming/modules/class_details/data/api/class_details_api.dart';
import 'package:learn_programming/modules/class_details/data/models/questions_model.dart';

final classDetailsControllerProvider =
    ChangeNotifierProvider.autoDispose<ClassDetailsController>((ref) {
  return ClassDetailsController();
});

/// future provider that calls the async api call [loadJsonData] and returns [QuestionsData] object
final loadJsonDataFutureProvider =
    FutureProvider<QuestionsData>((ref) async {
  return ClassDetailsApi.loadJsonData();
});

