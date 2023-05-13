class TextModel {
  TextModel({
    required this.position,
    required this.start,
    required this.end,
    required this.length,
    required this.text,
  });
  late final int position;
  late final int start;
  late final int end;
  late final int length;
  late final String text;

  TextModel.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    start = json['start'];
    end = json['end'];
    length = json['length'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['position'] = position;
    data['start'] = start;
    data['end'] = end;
    data['length'] = length;
    data['text'] = text;
    return data;
  }
}
