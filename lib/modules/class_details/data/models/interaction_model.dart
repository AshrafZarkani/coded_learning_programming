import 'package:learn_programming/modules/class_details/data/models/files_model.dart';
import 'package:learn_programming/modules/class_details/data/models/interaction_options_class.dart';

class InteractionModule {
  InteractionModule({
    required this.files,
    required this.type,
    required this.interactionOptions,
    required this.wrongOptions,
  });
  late final List<Files> files;
  late final String type;
  late final List<InteractionOptions> interactionOptions;
  late final List<String> wrongOptions;

  InteractionModule.fromJson(Map<String, dynamic> json) {
    files = List.from(json['files']).map((e) => Files.fromJson(e)).toList();
    type = json['type'];
    interactionOptions = List.from(json['interactionOptions'])
        .map((e) => InteractionOptions.fromJson(e))
        .toList();
    wrongOptions = List.castFrom<dynamic, String>(json['wrongOptions']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['files'] = files.map((e) => e.toJson()).toList();
    data['type'] = type;
    data['interactionOptions'] =
        interactionOptions.map((e) => e.toJson()).toList();
    data['wrongOptions'] = wrongOptions;
    return data;
  }
}
