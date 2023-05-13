
class PreInteraction {
  PreInteraction({
    required this.text,
    required this.type,
    required this.order,
    required this.id,
    required this.visiableIf,
  });
  late final String text;
  late final String type;
  late final int order;
  late final String id;
  late final String visiableIf;

  PreInteraction.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    type = json['type'];
    order = json['order'];
    id = json['id'];
    visiableIf = json['visiableIf'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['type'] = type;
    data['order'] = order;
    data['id'] = id;
    data['visiableIf'] = visiableIf;
    return data;
  }
}