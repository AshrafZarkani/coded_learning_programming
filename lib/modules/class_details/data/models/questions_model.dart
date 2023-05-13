import 'package:learn_programming/modules/class_details/data/models/files_model.dart';
import 'package:learn_programming/modules/class_details/data/models/interaction_model.dart';
import 'package:learn_programming/modules/class_details/data/models/interaction_options_class.dart';
import 'package:learn_programming/modules/class_details/data/models/post_interaction_model.dart';
import 'package:learn_programming/modules/class_details/data/models/pre_interaction.dart';

class QuestionsData {
  QuestionsData({
    required this.id,
    required this.preInteraction,
    required this.interactionModule,
    required this.postInteraction,
    required this.files,
    required this.type,
    required this.interactionOptions,
    required this.wrongOptions,
  });
  late final String id;
  late final List<PreInteraction> preInteraction;
  late final InteractionModule interactionModule;
  late final List<PostInteraction> postInteraction;
  late final List<Files> files;
  late final String type;
  late final List<InteractionOptions> interactionOptions;
  late final List<String> wrongOptions;

  QuestionsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    preInteraction = List.from(json['preInteraction'])
        .map((e) => PreInteraction.fromJson(e))
        .toList();
    interactionModule = InteractionModule.fromJson(json['interactionModule']);
    postInteraction = List.from(json['postInteraction'])
        .map((e) => PostInteraction.fromJson(e))
        .toList();
    files = List.from(json['files']).map((e) => Files.fromJson(e)).toList();
    type = json['type'];
    interactionOptions = List.from(json['interactionOptions'])
        .map((e) => InteractionOptions.fromJson(e))
        .toList();
    wrongOptions = List.castFrom<dynamic, String>(json['wrongOptions']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['preInteraction'] = preInteraction.map((e) => e.toJson()).toList();
    data['interactionModule'] = interactionModule.toJson();
    data['postInteraction'] = postInteraction.map((e) => e.toJson()).toList();
    data['files'] = files.map((e) => e.toJson()).toList();
    data['type'] = type;
    data['interactionOptions'] =
        interactionOptions.map((e) => e.toJson()).toList();
    data['wrongOptions'] = wrongOptions;
    return data;
  }
}
