import 'package:learn_programming/modules/class_details/data/models/questions_model.dart';
import 'package:learn_programming/modules/class_details/data/repository/class_details_repo.dart';

abstract class ClassDetailsApi {
  /// [loadJsonData] fake APi call to load the json data from interface from [ClassDetailsRepository]
  static Future<QuestionsData> loadJsonData() async {
    // call load json interface
    final data = await ClassDetailsRepository.loadJsonData();
    QuestionsData questionsData = QuestionsData.fromJson(data);
    return questionsData;
  }
}
