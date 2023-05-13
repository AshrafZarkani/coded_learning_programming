import 'package:learn_programming/modules/class_details/data/models/text_model.dart';

class InteractionOptions {
  InteractionOptions({
    required this.text,
    required this.correctOption,
  });
  late final TextModel text;
  late final bool correctOption;

  InteractionOptions.fromJson(Map<String, dynamic> json) {
    text = TextModel.fromJson(json['text']);
    correctOption = json['correctOption'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text.toJson();
    data['correctOption'] = correctOption;
    return data;
  }
}
